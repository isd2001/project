package app.controller.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import app.data.dogList;
import app.models.dogListRepository;

@Controller
@RequestMapping("/test")
public class testIndexController {
	
	@Autowired 
	dogListRepository dr;
	
	@Autowired
	dogList dl;

	@GetMapping("/main/index.do")
	public ModelAndView mainIndexController() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test.main.index");
		mav.addObject("top", "/WEB-INF/views/testfiles/mainTop.jsp");
		mav.addObject("main", "/WEB-INF/views/testfiles/main.jsp");
				
		
		return mav;
	}
	
	@GetMapping("/main/Nboard.do")
	public ModelAndView mainNboardController() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test.main.index");
		mav.addObject("top", "/WEB-INF/views/testfiles/NboardTop.jsp");
		mav.addObject("main", "/WEB-INF/views/testfiles/main.jsp");
		
		return mav;
	}
	
	@GetMapping("/main/dogTalk.do")
	public ModelAndView maindogTalkController() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test.main.index");
		mav.addObject("top", "/WEB-INF/views/testfiles/dogTalkTop.jsp");
		mav.addObject("main", "/WEB-INF/views/testfiles/dogTalk.jsp");
		
		return mav;
	}
	
	@GetMapping("/main/login.do")
	public ModelAndView mainLoginController() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test.login");		
		mav.addObject("main", "/WEB-INF/views/testfiles/login.jsp");
		
		return mav;
	}
	
	@GetMapping("/main/terms.do")
	public ModelAndView mainJoinController() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test.main.index");		
		mav.addObject("top", "/WEB-INF/views/testfiles/joinAd.jsp");
		mav.addObject("main", "/WEB-INF/views/testfiles/terms.jsp");
		
		return mav;
	}
	
	@GetMapping("/main/joinForm.do")
	public ModelAndView mainJoinFormController() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test.main.index");		
		mav.addObject("top", "/WEB-INF/views/testfiles/joinAd.jsp");
		mav.addObject("main", "/WEB-INF/views/testfiles/joinFrom.jsp");
		
		return mav;
	}
	
	
	@GetMapping("/main/dogBoard.do")
	public ModelAndView mainDogBoardController(WebRequest wr) {
		wr.setAttribute("allList", dr.getDogList(), wr.SCOPE_REQUEST);
		wr.setAttribute("bigDogList", dr.getDogListByType(1), wr.SCOPE_REQUEST);
		wr.setAttribute("medDogList", dr.getDogListByType(2), wr.SCOPE_REQUEST);
		wr.setAttribute("smallDogList", dr.getDogListByType(3), wr.SCOPE_REQUEST);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test.main.index");		
		mav.addObject("top", "/WEB-INF/views/testfiles/dogBoardTop.jsp");
		mav.addObject("main", "/WEB-INF/views/testfiles/dogBoard.jsp");
		
		return mav;
	}
}
