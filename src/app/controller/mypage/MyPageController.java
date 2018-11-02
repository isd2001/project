package app.controller.mypage;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import app.models.MyPageRepository;

@Controller("/mypage")
public class MyPageController {
	
	@Autowired
	MyPageRepository myPageRepository;

	@RequestMapping("/mypage.do")
	public ModelAndView indexHandle(WebRequest wr, ModelMap map) {
		Map userInfo = (Map)wr.getAttribute("userInfo", wr.SCOPE_SESSION);
			map.put("userInfo", userInfo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/mypage/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/mypage/index.jsp");
		
		return mav;
	}
	
	@RequestMapping("/myboard.do")
	public ModelAndView myboardHandle(WebRequest wr, ModelMap map) {
		Map userInfo = (Map)wr.getAttribute("userInfo", wr.SCOPE_SESSION);
		String writer = (String)userInfo.get("ID");
		List parcelList = myPageRepository.getByParcelList(writer);
			map.put("parcelList", parcelList);
		System.out.println(map.get("parcelList"));
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/mypage/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/mypage/myboard.jsp");
		
		return mav;
	}
	
	@RequestMapping("/mycomment.do")
	public ModelAndView myCommentHandle() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/mypage/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/mypage/mycomment.jsp");
		
		return mav;
	}
}
