package app.controller.doghospital;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("/doghospital")
public class DogHospitalController {

	@RequestMapping("/doghospital.do")
	public ModelAndView dogHospitalHandle() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/doghospital/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/doghospital/index.jsp");
		
		return mav;
	}
}
