package app.controller.dogTraining;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import app.models.dogtrainingRepository;

@Repository
@RequestMapping("/dogTraining")
public class dogTrainingController {

	@Autowired
	Gson gson;
	
	//게시판 DAO
	@Autowired
	dogtrainingRepository dr;
	
	//리스트 불러오기
	@GetMapping("training.do")
	public ModelAndView dtboardHandler(WebRequest wreq,@RequestParam Map map,Model model) {
		
		List<Map> getAlldt = dr.getAlldt();
		System.out.println("getAlldt >>" + getAlldt);
		
		wreq.setAttribute("list", getAlldt, WebRequest.SCOPE_REQUEST);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/dogTraining/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/dogTraining/main.jsp");
		
		return mav;
	
	} // end dtboard
	
	//글 목록 클릭해서 디테일
		@GetMapping("/detail.do")
		public ModelAndView readdt(@RequestParam int NUM,WebRequest wreq) {
			Map read =dr.readdt(NUM);
			System.out.println("글 정보>>"+ read );
			
			List<Map> readcomment=dr.readcomment(NUM);
			
			wreq.setAttribute("read",read, wreq.SCOPE_REQUEST);
			wreq.setAttribute("comment", readcomment, wreq.SCOPE_REQUEST);
			System.out.println("comment >>> " + readcomment);
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("master");
			mav.addObject("top", "/WEB-INF/views/master/dogTraining/top.jsp");
			mav.addObject("main", "/WEB-INF/views/master/dogTraining/detail.jsp");
			
			
			return mav;
		} //end dtboardread
		
		//글쓰기
		@GetMapping("/write.do")
		public ModelAndView writeHandle() {	
			ModelAndView mav = new ModelAndView();
			mav.setViewName("master");
			mav.addObject("top", "/WEB-INF/views/master/dogTraining/top.jsp");
			mav.addObject("main", "/WEB-INF/views/master/dogTraining/write.jsp");
			
			return mav;
		}//end dttwrite
		
		//글쓰고 저장
		@PostMapping("/write.do")
		public ModelAndView adddtboard(@RequestParam Map map , WebRequest wreq) {
			Map userInfo = (Map)wreq.getAttribute("userInfo", RequestAttributes.SCOPE_SESSION);
			String target = (String)userInfo.get("ID");
			String sub = (String)map.get("SUB");
			String con = (String)map.get("CON");
			Date day = new Date();
			SimpleDateFormat sdf =  new SimpleDateFormat("yyyy-MM-dd HH:mm");
			
			
			System.out.println("userinfo >" + userInfo);
			System.out.println("sub > " + sub);
			System.out.println("target >"+target);
			System.out.println("day >"+day);
			
			
			Map m= new HashMap<>();
			m.put("DTBOARDID" , target);
		    m.put("SUB", sub);
			m.put("CON", con);
			m.put("CDATE", sdf.format(day));
			
			System.out.println("정보 >>>" + m );
			
			try {
				int result=dr.adddtboard(m);
				System.out.println("result >" + result);
					if (result==1) {
						wreq.setAttribute("result",result, WebRequest.SCOPE_REQUEST);
						
						ModelAndView mav = new ModelAndView();
						mav.setViewName("redirect:/dogTraining/training.do");
						
						return mav;
					}else {
						ModelAndView mav = new ModelAndView();
						wreq.setAttribute("result",result, WebRequest.SCOPE_REQUEST);
						mav.setViewName("master");
						mav.addObject("top", "/WEB-INF/views/master/dogTraining/top.jsp");
						mav.addObject("main", "/WEB-INF/views/master/dogTraining/training.jsp");
						
						return mav;
					}
				}  catch (Exception e) {
					e.printStackTrace();
					wreq.setAttribute("result","no", WebRequest.SCOPE_REQUEST);
			
				}
				ModelAndView mav = new ModelAndView();
				mav.setViewName("master");
				mav.addObject("top", "/WEB-INF/views/master/dogTraining/top.jsp");
				mav.addObject("main", "/WEB-INF/views/master/dogTraining/training.jsp");
				
				return mav;
			
		}  //end adddtboard

		
		
		
		
}
	
	

