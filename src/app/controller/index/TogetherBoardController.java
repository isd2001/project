package app.controller.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/together")
public class TogetherBoardController {
	
	@GetMapping("/mainboard.do")
	public String mainboard() {
		
		return "main.togetherboard";
	}
	
	
}
