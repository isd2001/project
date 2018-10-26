package app.controller.board;


import java.sql.Time;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;

import app.models.TogetherRepository;

@Controller
@RequestMapping("/together")
public class TogetherBoardController {
	@Autowired
	TogetherRepository together;
	
	
	@GetMapping("/mainboard.do")
	public String mainboard(WebRequest wreq,@RequestParam Map param) {
		
		System.out.println("param > "+param);
		/*if (re=="yes") {
			wreq.setAttribute("result","yes",WebRequest.SCOPE_REQUEST);
		}*/
		
		List<Map> list=together.getAllTogether();
		
		for (int i = 0; i < list.size(); i++) {
			
		}
		
		System.out.println("list > "+list);
		wreq.setAttribute("list",list, WebRequest.SCOPE_REQUEST);
		
		return "main.togetherboard";
	}
	
	@GetMapping("/selectboard.do")
	public String selsctboard(@RequestParam Map target) {
		String area=(String)target.get("area");
		
		System.out.println("target>"+area);
		
		return "main.selectboard";
	}
	
	@GetMapping("/new.do")
	public String newGetboard() {
		return "main.newboard";
	}
	
	@PostMapping("/new.do")
	public String newPostboard(@RequestParam Map map,WebRequest wreq) {
		String d=(String) map.get("day");		
		String t =(String) map.get("time");		
		String day = d+" "+t;
		
		Map m = new HashMap<>();
			m.put("title", map.get("title"));
			m.put("content", map.get("content"));
			m.put("day", day);
			m.put("area", map.get("area"));
			m.put("latitude", map.get("latitude"));
			m.put("longitude", map.get("longitude"));
			m.put("address", map.get("address"));
		System.out.println("정보 >"+m);		
		
		try {
			int result=together.addTogetherBoard(m);
			if (result!=1) {
				wreq.setAttribute("result","no", WebRequest.SCOPE_REQUEST);
				return "main.newboard";
			}else {
				wreq.setAttribute("result","yes", WebRequest.SCOPE_REQUEST);
				return "redirect:/together/mainboard.do";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			wreq.setAttribute("result","no", WebRequest.SCOPE_REQUEST);
			return "main.newboard";
		}
		
		
	}
	
	@GetMapping("/map.do")
	public String mapGetHandle() {
		
		return "together.board/map";
	}
	

	@GetMapping("/map2.do")
	public String map2GetHandle() {
		
		return "together.board/map2";
	}
	
	
}
