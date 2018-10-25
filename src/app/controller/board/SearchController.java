package app.controller.board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

@Controller
public class SearchController {
	@Autowired
	Gson gson;
	
	
	@GetMapping("/search.do")
	@ResponseBody
	public void searchHandle(@RequestParam Map map) {
		System.out.println("param>"+map);
		
		
	/*	List<Map> searchlist = new ArrayList<>();
		Map m = new HashMap<>();
			m.put("dog_name", "해피");
			m.put("x", "127.01182625885103");
			m.put("y", "37.66432536253668");
		searchlist.add(m);*/
		
				
		
		//gson.toJson(searchlist);
		
		
	};
	
}
