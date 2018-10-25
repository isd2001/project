package app.controller.Nboard;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Nboard")
public class NboardController {

	@GetMapping("/list.do")
	public String NboardHandler() {
		
		return "Nboard.list";
	}
	 @RequestMapping(value="/Nboard/write.do")
	    public String NBoardForm() throws Exception{
	        
	        return "board.write";
	}
}
