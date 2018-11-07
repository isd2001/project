package app.controller.index;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import app.models.OnechatRepository;
import app.models.accountRepository;
import app.service.Rooms;
import app.service.SocketService;
import app.service.WeatherService;


@Controller
public class IndexController {
	@Autowired
	SocketService socketservice;
	
	@Autowired
	accountRepository ar;
	
	@Autowired
	ServletContext ctx;
	
	@Autowired
	WeatherService ws;
	
	@Autowired
	Gson gson;
	
	@Autowired
	OnechatRepository onechat; 
	
	@Autowired
	ChatSocketController chatSocket;
	
	
	
	
	
	@GetMapping("/index.do")
	public ModelAndView indexHandle(WebRequest wr) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main.index");
		mav.addObject("center", "/WEB-INF/views/default/center.jsp");
		
		return mav;
	}
	
	@GetMapping("/join.do")
	public ModelAndView joinHandle() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main.join");
		mav.addObject("center", "/WEB-INF/views/join/index.jsp");
		
		return mav;
		
	}
	
	@GetMapping("/joinForm.do")
	public ModelAndView joinFormHandle() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main.join");
		mav.addObject("center", "/WEB-INF/views/join/joinForm.jsp");
		return mav;	
	}
	
	@PostMapping("/joinFormHandle.do")
	public ModelAndView joinFormPostHandle(@RequestParam Map param, WebRequest wr, @RequestParam MultipartFile dogProfile) throws IllegalStateException, IOException {
		long time = System.currentTimeMillis();
		System.out.println("joinFormHandle post");
		System.out.println("param = "+param);
		String add = (String) param.get("address");
		String add2= (String) param.get("address2");
		String address = add+add2;
		param.put("address", address );
		param.remove("address2");
		
		String dogProfileName = String.valueOf(time) + "_" + dogProfile.getOriginalFilename();

		String path = ctx.getRealPath(String.valueOf(time));
		
		File dir = new File(path);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		File dst = new File(dir, dogProfileName);		
		dogProfile.transferTo(dst);
		
		
		String attachDogProfile = "/" + time + "/" + dogProfileName;
		
		
		param.put("dogProfile", attachDogProfile);
		ModelAndView mav = new ModelAndView();
		
		try {
			int r = ar.addAccount(param);
			wr.setAttribute("joinSucess", 1, wr.SCOPE_REQUEST);
			mav.setViewName("main.join");
			mav.addObject("center", "/WEB-INF/views/default/login.jsp");
			
			return mav;
		}catch(Exception e) {
			e.printStackTrace();
			wr.setAttribute("joinFailed", 1, wr.SCOPE_REQUEST);
			mav.setViewName("main.join");
			mav.addObject("center", "/WEB-INF/views/join/joinForm.jsp");
			return mav;
		}	
			
	}
	
	@PostMapping("/login.do")
	public ModelAndView loginHandle(@RequestParam Map param, WebRequest wr) {
		ModelAndView mav = new ModelAndView();	
		
		if(ar.getPwById(param)) {						
			Map userInfo =  ar.getUserInfo((String)param.get("id"));
		
			
			wr.setAttribute("userInfo", userInfo, wr.SCOPE_SESSION);
			System.out.println("userInfo >"+userInfo);
			String gu = ws.getCoordinateByAddress((String)userInfo.get("ADDRESS"));
			wr.setAttribute("gu", gu, wr.SCOPE_SESSION);
			
			
			mav.setViewName("main.index");
			mav.addObject("center", "/WEB-INF/views/default/center.jsp");		
			
			
			
			return mav;
		}else {
			wr.setAttribute("loginFailed", 1, wr.SCOPE_REQUEST);
			mav.setViewName("main.join");
			mav.addObject("center", "/WEB-INF/views/default/login.jsp");		
			return mav;
			
		}
	}
	
	@GetMapping("/logout.do")
	public ModelAndView logoutHandle(WebRequest wr) {
		wr.removeAttribute("userInfo", wr.SCOPE_SESSION);
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/main/index.do");
		
		return mav;
	}
	
	@GetMapping(path="/validate.do", produces="application/json;charset=UTF-8")	
	@ResponseBody
	public String validate(@RequestParam Map param) {
		String mode = (String) param.get("mode");
		
		switch(mode) {
		case "id" :
				if(ar.checkId((String)param.get("input"))==null){
					return gson.toJson(true);
				}else {
					return gson.toJson(false);
				}	
				
		case "nick" :
			System.out.println(ar.checkNick((String)param.get("input"))==null);
			System.out.println((String)param.get("input"));
				if(ar.checkNick((String)param.get("input"))==null){
					return gson.toJson(true);
				}else {
					return gson.toJson(false);
				}				
		}
		return "";
	}
			
	@RequestMapping("/onetalk.do")	
	public String onetalkHandle(@RequestParam Map param,WebRequest wr,ModelMap map) {	
		String targetNick = (String)param.get("talkNick");		
		System.out.println("target > "+ targetNick);		
					
		wr.setAttribute("recipient", targetNick, wr.SCOPE_REQUEST);		
		//========================================
		Map user =(Map) wr.getAttribute("userInfo",wr.SCOPE_SESSION);
		String senderNick = (String) user.get("NICKNAME");
		System.out.println("sender > "+senderNick);		
		
		Map nickNames = new HashMap<>();
			nickNames.put("sender", senderNick);
			nickNames.put("recipient", targetNick);
			
		List<Map> chatlist=onechat.getOneChat(nickNames);
			map.addAttribute("chatlist",chatlist);
		
		
		
		/*String uuid = UUID.randomUUID().toString().split("-")[0];
		
		Rooms room = new Rooms(uuid);
			room.addUsers(senderNick, targetNick );
			*/
		System.out.println("roomNumber : "+param.get("roomNumber"));						
			
		
		if(param.get("roomNumber").equals("undefined")) {
			System.out.println("roomNumber undefined");
			String roomNumber = UUID.randomUUID().toString().split("-")[0];;
			Map<String,List<String>> roomMembers = chatSocket.privateRoomMembers;
			
			Set keyset = roomMembers.keySet();
			Iterator itr = keyset.iterator();
			
			while (itr.hasNext()) {
				String key = (String) itr.next();
				List list = roomMembers.get(key);
				if(list.contains(senderNick)&&list.contains(targetNick)) {
					roomNumber=key;
				}
			}
			
			System.out.println(roomMembers);
		    wr.setAttribute("roomNumber", roomNumber, wr.SCOPE_REQUEST);
		}else {
			wr.setAttribute("roomNumber", param.get("roomNumber"), wr.SCOPE_REQUEST);
		}
		
		return "master/chat/onetalk";
	}//end onetalk.do
	
	
	@GetMapping(path="/infomodal.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String InfomodalHandle(@RequestParam Map param,WebRequest wreq) {
		System.out.println("Infomodal>"+param);
		String nick = (String)param.get("nick");
		
		Map result =ar.getInfomodalByNick(nick);
		System.out.println("result >>>"+result);
		return gson.toJson(result);
	}//end Infomodal.do
	
}

