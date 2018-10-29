package app.controller.Nboard;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping(value="/nboard/write.do")
    public String writeBoardForm() throws Exception{
        
        return "nboard/writeForm";
		
	}//end 글쓰기 폼
	
	


@RequestMapping(value="/board/viewContent.do")
public String viewForm(@ModelAttribute("boardVO") BoardVO boardVO, Model model, HttpServletRequest request) throws Exception{
	
	int code = Integer.parseInt(request.getParameter("code"));
	boardVO.setCode(code);
	
	BoardVO resultVO = boardServiceImpl.selectBoardByCode(boardVO);
	
	model.addAttribute("result", resultVO);
	
	return "nboard/view";
	
	
}
}
