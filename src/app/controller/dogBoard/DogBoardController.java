package app.controller.dogBoard;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.WebRequest;

@Controller
@RequestMapping("/board")
public class DogBoardController {

	@GetMapping("/main.do")
	public String mainHandle() {
		
		return "dogBoard.main";
	}
}

