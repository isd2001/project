package app.controller.dogTalk;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dogTalk")

public class dogTalkController {
	
	@GetMapping("/index.do")
	public String indexController() {
		return "dogTalk.index";
	}
}
