package app.controller.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.SystemEnvironmentPropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import app.models.searchRepository;

@Controller
@RequestMapping("/search")
public class MainSearchController {
	
	@Autowired
	searchRepository sr;
	
	@GetMapping("/result.do")
	public ModelAndView mainSearchController(@RequestParam String search) {
		ModelAndView mav = new ModelAndView();
		System.out.println(search);		
		
		List resultFromFind = sr.resultForSearchFromFindTitle(search);
		List resultFromParcel = sr.resultForSearchFromParcelTitle(search);
		List resultFromDogList = sr.resultForSearchFromDogList(search);
		
		if(resultFromFind.size()!=0) {
			mav.addObject("find",resultFromFind);
		}
		if(resultFromParcel.size()!=0) {
			mav.addObject("parcel",resultFromParcel);
		}
		if(resultFromDogList.size()!=0) {
			mav.addObject("dogList",resultFromDogList);		
		}
		
		System.out.println(resultFromDogList);
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/search/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/search/searchResult.jsp");
		mav.addObject("search", search);
		
		return mav;
	}
}
