package app.controller.index;
import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import app.models.accountRepository;
import app.service.WeatherService;


@Controller
public class IndexController {
	
	@Autowired
	accountRepository ar;
	
	@Autowired
	ServletContext ctx;
	
	@Autowired
	WeatherService ws;
	
	@Autowired
	Gson gson;
	
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
			String gu = ws.getCoordinateByAddress((String)userInfo.get("ADDRESS"));
			wr.setAttribute("gu", gu, wr.SCOPE_SESSION);			
			System.out.println(gu);
			
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
		mav.setViewName("main.index");
		mav.addObject("center", "/WEB-INF/views/default/center.jsp");
		
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
			
			
	
}

