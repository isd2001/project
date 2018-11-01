package app.controller.main;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import app.models.accountRepository;
import app.service.WeatherService;

@Controller
@RequestMapping("/main")
public class MainController {
	@Autowired
	accountRepository ar;
	
	@Autowired
	ServletContext ctx;
	
	@Autowired
	WeatherService ws;
	
	@Autowired
	Gson gson;	

	
	@GetMapping("/index.do")
	public ModelAndView mainIndexHandle(WebRequest wr) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/index/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/index/main.jsp");
		
		return mav;
	}
	

	@GetMapping("/login.do")
	public ModelAndView mainLoginHandle(WebRequest wr) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/login/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/login/main.jsp");
		
		return mav;
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
			
			mav.setViewName("master");
			mav.addObject("top", "/WEB-INF/views/master/index/top.jsp");
			mav.addObject("main", "/WEB-INF/views/master/index/main.jsp");
			
			return mav;
		}else {
			wr.setAttribute("loginFailed", 1, wr.SCOPE_REQUEST);
			mav.addObject("top", "/WEB-INF/views/master/login/top.jsp");
			mav.addObject("main", "/WEB-INF/views/master/login/main.jsp");
			
			return mav;
			
		}
	}
	
	@GetMapping("/terms.do")
	public ModelAndView mainTermsHandle(WebRequest wr) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/login/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/login/main.jsp");
		
		return mav;
	}
	
	@GetMapping("/joinform.do")
	public ModelAndView mainjoinformHandle(WebRequest wr) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/join/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/join/joinform.jsp");
		
		return mav;
	}
	
	@PostMapping("/joinform.do")
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
			mav.setViewName("master");
			mav.addObject("top", "/WEB-INF/views/master/index/top.jsp");
			mav.addObject("main", "/WEB-INF/views/master/index/main.jsp");
			
			return mav;
		}catch(Exception e) {
			e.printStackTrace();
			wr.setAttribute("joinFailed", 1, wr.SCOPE_REQUEST);
			
			mav.setViewName("master");
			mav.addObject("top", "/WEB-INF/views/master/index/top.jsp");
			mav.addObject("main", "/WEB-INF/views/master/index/main.jsp");			
			return mav;
		}	
			
	}
}
