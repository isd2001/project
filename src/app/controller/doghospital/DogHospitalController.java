package app.controller.doghospital;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import app.models.DogHospitalRepository;

@Controller("/doghospital")
public class DogHospitalController {
	
	@Autowired
	DogHospitalRepository dhr;

	@RequestMapping("/doghospital.do")
	public ModelAndView dogHospitalHandle() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/doghospital/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/doghospital/index.jsp");
		
		return mav;
	}
	
	@RequestMapping("/getdh.do")
	public ModelAndView getDogHospital(@RequestParam String gu, ModelMap map) {
		List<Map> dhlist = dhr.getDogHospitalByGu(gu);
		map.put("dhlist", dhlist);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/doghospital/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/doghospital/index.jsp");
		mav.addObject("dhlist", dhlist);
		
		return mav;
		
	}
}
