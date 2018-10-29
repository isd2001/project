package app.controller.Nboard;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;

import app.models.NboardRepository;

@Controller
@RequestMapping("/Nboard")
public class NboardController {
	@Autowired
	NboardRepository nboard;
	
	
	// 공지사항 이동
	@GetMapping("/list.do")
	public String NboardHandler(WebRequest wreq,@RequestParam Map map,Model model) {
		
		List<Map> Allboard =nboard.getAllNboard();
		System.out.println("allboard > "+ Allboard);
		
		
		// webrequest - > 보낼때
		// @requestparam -> 같고올때
		// model -> 보낼때 , 일회성
		
		wreq.setAttribute("list", Allboard, WebRequest.SCOPE_REQUEST);
		
		
		return "Nboard.list";
	}//end NboardHandle
	
	
	
	
	
	
}//end class
