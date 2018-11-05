package app.controller.doghospital;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import app.models.DogHospitalRepository;

@Controller("/doghospital")
public class DogHospitalController {
	
	@Autowired
	DogHospitalRepository dhr;
	
	@Autowired
	Gson gson;

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
		List dhlist = dhr.getDogHospitalByGu(gu);
			map.put("dhlist", dhlist);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/doghospital/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/doghospital/select.jsp");
		
		return mav;
		
	}
	
	// 좌표 JSON 문자열 만들기
	@RequestMapping("/coord.do")
	public String getByCoord(ModelMap map) {
		List positions = dhr.getByCoord();
		map.put("positions", positions);
		return "master/doghospital/coordjson";
	}
	
	@RequestMapping("/coordinates.do")
	public String getByCoordinates(ModelMap map) {
		List positions = dhr.getByCoord();
		map.put("positions", positions);
		return gson.toJson(positions);
	}
	
	@RequestMapping("/xycoord.do")
	public void getByXycoord(ModelMap map) {
		List positions = dhr.getByCoord();
		map.put("positions", positions);
	}
}
