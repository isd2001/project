package app.controller.Nboard;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import app.models.NboardRepository;

@Controller
@RequestMapping("/Nboard")
public class NboardController {

	
	private static final String Allboard = null;
	private static final String Nboard = null;
	private static final String ID = null;
	@Autowired
	NboardRepository nr;



	// 공지사항 이동
	@GetMapping("/list.do")
	public ModelAndView NboardHandler(WebRequest wreq,ModelMap mmap ,@RequestParam(required=false)String p) {
		
		Date day= new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(day);
        mmap.put("date", date);
        
    		
		
	
	
	Map map = new HashMap(); 
	int pp = (p == null) ? 1: Integer.parseInt(p);
	
	map.put("s", 1+(pp-1)*6);
	map.put("e", pp*6);
	
	List<Map> every =nr.getfind(map);
	mmap.put("every", every);
		
	
		

		
		// webrequest - > 보낼때
		// @requestparam -> 같고올때
		// model -> 보낼때 , 일회성
		
		

		ModelAndView mav = new ModelAndView();
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/Nboard/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/Nboard/list.jsp");
		
		return mav;


	}//end NboardHandle
    
	//글쓰기
	@GetMapping("/write.do")
	public ModelAndView writeGetHandle() {	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/Nboard/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/Nboard/write.jsp");
		
		return mav;
	}//end getwrite
	
     //글쓰고 저장
	@PostMapping("/write.do")
	public ModelAndView addlistBoard(@RequestParam Map map , WebRequest wreq) {
		Map userInfo = (Map)wreq.getAttribute("userInfo", RequestAttributes.SCOPE_SESSION);
		System.out.println("userInfo > "+userInfo);
		String target = (String)userInfo.get("ID");
		String sub = (String)map.get("BOARD_SUBJECT");
		String con = (String)map.get("BOARD_CONTENT");
		Date day = new Date();
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");

		
		System.out.println("userinfo >" + userInfo);
		System.out.println("sub > " + sub);
		System.out.println("target >"+target);
		System.out.println("day >"+sdf);
		
		
		
		Map m = new HashMap<>();
		    m.put("BOARD_ID" , target);
		    m.put("BOARD_SUBJECT", sub);
			m.put("BOARD_CONTENT", con);
			m.put("BOARD_DATE", sdf.format(day));
			
			
		System.out.println("정보 >>>" + m);
		
		
		try {
			int result=nr.addlistBoard(m);
			System.out.println("result >" + result);
				if (result==1) {
					wreq.setAttribute("result",result, WebRequest.SCOPE_REQUEST);
					
					ModelAndView mav = new ModelAndView();
					mav.setViewName("redirect:/Nboard/list.do");
					
					return mav;
				}else {
					ModelAndView mav = new ModelAndView();
					wreq.setAttribute("result",result, WebRequest.SCOPE_REQUEST);
					mav.setViewName("master");
					mav.addObject("top", "/WEB-INF/views/master/Nboard/top.jsp");
					mav.addObject("main", "/WEB-INF/views/master/Nboard/list.jsp");
					
					return mav;
				}
			}  catch (Exception e) {
				e.printStackTrace();
				wreq.setAttribute("result","no", WebRequest.SCOPE_REQUEST);
		
			}
			ModelAndView mav = new ModelAndView();
			mav.setViewName("master");
			mav.addObject("top", "/WEB-INF/views/master/Nboard/top.jsp");
			mav.addObject("main", "/WEB-INF/views/master/Nboard/list.jsp");
			
			return mav;
		
	}//end write


	//글 삭제하기.
	@RequestMapping("delete.do")
	public ModelAndView nboarddelete(@RequestParam int BOARD_NUM , WebRequest wreq) {
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/Nboard/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/Nboard/list.jsp");
		return mav;
		
	}
	
	
	
	
	//글 목록 클릭해서 디테일
	@GetMapping("/detail.do")
	public ModelAndView nboardread(@RequestParam int BOARD_NUM ,WebRequest wreq) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Map read =nr.nboardread(BOARD_NUM);
		System.out.println("글 정보>>"+ read );
		
		read.put("BOARD_DATE", sdf.format(read.get("BOARD_DATE")));


		
		wreq.setAttribute("read",read, WebRequest.SCOPE_REQUEST);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/Nboard/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/Nboard/detail.jsp");
		
		return mav;
	} //end getRead
	

	
}


/*
 * 
		List<Map> Allboard =nr.getAllNboard();
		System.out.println("allboard > "+ Allboard);


	wreq.setAttribute("list", Allboard, WebRequest.SCOPE_REQUEST);



		for (int i =0; i<getfind.size(); i++) {
		getfind.get(i).put("BOARD_DATE",sdf.format(getfind.get(i).get("BOARD_DATE")));
		System.out.println("Allboard" + getfind);
 * 
 */
