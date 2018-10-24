package app.controller.dogBoard;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import app.data.dogList;

@Controller
@RequestMapping("/board")
public class DogBoardController {

	@Autowired 
	dogList dl;
	
	@GetMapping("/main.do")
	public ModelAndView mainHandle(WebRequest wr) {
		wr.setAttribute("allList", dl.getAllList(), wr.SCOPE_REQUEST);
		wr.setAttribute("bigDogList", dl.getBigDog(), wr.SCOPE_REQUEST);
		wr.setAttribute("medDogList", dl.getMedDog(), wr.SCOPE_REQUEST);
		wr.setAttribute("smallDogList", dl.getSmallDog(), wr.SCOPE_REQUEST);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("dogBoard.main");
		mav.addObject("center", "/WEB-INF/views/dogBoard/dogBoard.jsp");
		return mav;
		
	
	}
	
	@GetMapping("/myDog.do")
	public ModelAndView myDogHandle (WebRequest wr) {
		wr.setAttribute("allList", dl.getAllList(), wr.SCOPE_REQUEST);
		wr.setAttribute("bigDogList", dl.getBigDog(), wr.SCOPE_REQUEST);
		wr.setAttribute("medDogList", dl.getMedDog(), wr.SCOPE_REQUEST);
		wr.setAttribute("smallDogList", dl.getSmallDog(), wr.SCOPE_REQUEST);
	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("dogBoard.main");
		mav.addObject("center", "/WEB-INF/views/dogBoard/myDog.jsp");
		return mav;
	} 
	
}

