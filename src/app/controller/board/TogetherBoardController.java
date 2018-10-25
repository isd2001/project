package app.controller.board;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/together")
public class TogetherBoardController {
	
	@GetMapping("/mainboard.do")
	public String mainboard() {
		
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
	public String newPostboard(@RequestParam Map map) {
		System.out.println("정보 > "+ map);
		
		
		
		
		return "";
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
