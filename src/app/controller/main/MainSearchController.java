package app.controller.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/search")
public class MainSearchController {
	
	
	@GetMapping("/result.do")
	public ModelAndView mainSearchController(@RequestParam String search) {
		
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/search/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/search/searchResult.jsp");
		
		return mav;
	}
}
