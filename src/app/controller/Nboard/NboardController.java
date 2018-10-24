package app.controller.Nboard;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/nboard")
public class NboardController {

	@GetMapping("/index.do")
	public String nboardIndexController() {
		
		return "nboard.index";
	}
}
