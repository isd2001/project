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
import app.models.dogListRepository;

@Controller
@RequestMapping("/board")
public class DogBoardController {

	@Autowired 
	dogListRepository dr;
	
	@Autowired
	dogList dl;
	
	@GetMapping("/main.do")
	public ModelAndView mainHandle(WebRequest wr) {
		wr.setAttribute("allList", dr.getDogList(), wr.SCOPE_REQUEST);
		wr.setAttribute("bigDogList", dr.getDogListByType(1), wr.SCOPE_REQUEST);
		wr.setAttribute("medDogList", dr.getDogListByType(2), wr.SCOPE_REQUEST);
		wr.setAttribute("smallDogList", dr.getDogListByType(3), wr.SCOPE_REQUEST);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("dogBoard.main");
		mav.addObject("center", "/WEB-INF/views/dogBoard/dogBoard.jsp");
		return mav;
		
	
	}
	
	@GetMapping("/myDog/write.do")
	public ModelAndView myDogWriteHandle() {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("dogBoard.main");
			mav.addObject("center", "/WEB-INF/views/dogBoard/myDogWrite.jsp");
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

