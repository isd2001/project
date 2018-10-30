package app.controller.dogTraining;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

@Repository
@RequestMapping("/dogTraining")
public class dogTrainingController {

	@Autowired
	Gson gson;
	
	@GetMapping("/training.do")
	public ModelAndView trainingHandle() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("dogTraining.index");		
		mav.addObject("center", "/WEB-INF/views/dogTraining/training.jsp");		
		
		
		return mav;
	}
	
	@GetMapping("/gaejalang.do")
	public ModelAndView gaejalangHandle() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("dogTraining.index");		
		mav.addObject("center", "/WEB-INF/views/dogTraining/gaejalang.jsp");		
		
		
		return mav;
	}
}
