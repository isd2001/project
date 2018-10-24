package app.controller.index;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.context.request.WebRequest;


@Controller

public class IndexController {

	
	@GetMapping("/index.do")
	public String indexHandle(WebRequest wr) {
	
		return "main.index";
	}
		
}