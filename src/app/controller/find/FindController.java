package app.controller.find;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.WebRequest;

@Controller
public class FindController {

	@GetMapping("/list.do")
	public String listHandler(WebRequest wr) {
		
		return "main.find.list";
	}
	
	@RequestMapping("/write.do")
	public String writeHandler(WebRequest wr) {
		
		return "main.find.write";
	}
}
