package app.controller.dogTraining;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import app.models.dogtrainingRepository;

@Repository
@RequestMapping("/dogTraining")
public class dogTrainingController {

	@Autowired
	Gson gson;
	
	@Autowired
	dogtrainingRepository dr;
	
	//리스트 불러오기
	@GetMapping("training.do")
	public String dtboardHandler(WebRequest wreq,@RequestParam Map map,Model model) {
		
		List<Map> getAlldt = dr.getAlldt();
		System.out.println("getAlldt >>" + getAlldt);
		
		wreq.setAttribute("list", getAlldt, WebRequest.SCOPE_REQUEST);
		
		
		return "dogTraining.training";
	} // end dtboard
	
	//글 목록 클릭해서 디테일
		@GetMapping("/detail.do")
		public String readdt(@RequestParam int NUM,WebRequest wreq) {
			Map read =dr.readdt(NUM);
			System.out.println("글 정보>>"+ read );
			
			wreq.setAttribute("read",read, WebRequest.SCOPE_REQUEST);

			return "dogTraining/detail";
		} //end dtboardread
		
		//글쓰기
		@GetMapping("/write.do")
		public String writeHandle() {	
			return "dogTraining/write";
		}//end dttwrite
	
}
