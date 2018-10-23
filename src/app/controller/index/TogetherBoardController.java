package app.controller.index;

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
		System.out.println("target>"+target.get("area"));
		
		return "main.selectboard";
	}
	
	
}
