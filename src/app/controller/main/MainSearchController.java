package app.controller.main;

import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
		
		String[] searchKeyWords = search.split("\\s");
		
		System.out.println(searchKeyWords.toString());
		
		List list1 ;
		
		
		for (int i = 0; i < searchKeyWords.length; i++) {
			list1=sr.resultForSearchFromDogList(searchKeyWords[i]);
			for (int j = 1; j < searchKeyWords.length; j++) {
				Map map= (Map) list1.get(i);
				if(map.containsValue(searchKeyWords[j])==false){
					list1.remove(i);
				}
			}
		}
				
		
		
		
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
