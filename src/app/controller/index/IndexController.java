package app.controller.index;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;


@Controller

public class IndexController {
	
	
	@GetMapping("/index.do")
	public String indexHandle(WebRequest wr) {
	
		return "main.index";
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
	
	@GetMapping("/address.do")
	public String addressHandle() {
		
		return "join/address";
	}
}