package app.controller.find;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import app.models.FindRepository;

@Controller
@RequestMapping("/find")
public class FindController {

	@Autowired
	ServletContext ctx;

	@Autowired
	FindRepository findRepository;

	// 게시글 List 화면

	@GetMapping("/list.do")

	public ModelAndView listNeoHandler(ModelMap mmap, WebRequest wr, @RequestParam (required=false)String p) {
	
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(today);
		mmap.put("date", date);
		
	
		//-------------------------------------
		Map map = new HashMap();
		int pp = (p == null) ? 1 : Integer.parseInt(p);
		
		map.put("s", 1 + (pp-1) * 6);
		map.put("e", pp*6);
		
		List<Map> every = findRepository.getSomeFind(map);
		mmap.put("every",every);
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/find/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/find/list.jsp");
		
		return mav;
	}

	
	
	// 이 밑으로 손 안댔음

	@GetMapping("/write.do")
	public ModelAndView writeHandler() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/find/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/find/write.jsp");
		
		return mav;
	}
	
	// 게시글 write 화면
	@PostMapping("/start.do")
	public ModelAndView startHandler(@RequestParam Map rmap, @RequestParam MultipartFile picture,
		ModelMap mmap, WebRequest wr) throws IOException {
		
		Map userInfo = (Map)wr.getAttribute("userInfo", wr.SCOPE_SESSION);
		
		String nick =  (String) userInfo.get("NICKNAME");
		
		System.out.println("rmap = "+rmap);
		System.out.println(picture);

//		System.out.println("mapx: + " + mapx);
		rmap.put("nick",nick);
		
		// 파일 첨부
		long time = System.currentTimeMillis();
		String fileName = String.valueOf(time) + "_" + picture.getOriginalFilename();
		System.out.println(fileName);
		String path = ctx.getRealPath(String.valueOf(time));
		
		File dir = new File(path);

		if (!dir.exists()) {
			dir.mkdirs();
		}
		File dst = new File(dir, fileName);

		picture.transferTo(dst);
		
		String pictureName = "/" + time + "/" + fileName;
		rmap.put("picture", pictureName);

		try {
			int r = findRepository.addAllFind(rmap);
			System.out.println(r);
			mmap.put("map", rmap);
			ModelAndView mav = new ModelAndView();
			mav.setViewName("master");
			mav.addObject("top", "/WEB-INF/views/master/find/top.jsp");
			mav.addObject("main", "/WEB-INF/views/master/find/result.jsp");
			
			return mav;
		}catch(Exception e) {
			e.printStackTrace();
			ModelAndView mav = new ModelAndView();
			mav.setViewName("master");
			mav.addObject("top", "/WEB-INF/views/master/find/top.jsp");
			mav.addObject("main", "/WEB-INF/views/master/find/write.jsp");
			
			return mav;
		}

	}

	@RequestMapping("/detail.do")
	public ModelAndView detailHandler(@RequestParam (required=false)int no, ModelMap mmap) {	
		
		Map data = findRepository.getByNo(no);
		mmap.put("data", data);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/find/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/find/detail.jsp");
		
		return mav;
	}
	
	@RequestMapping("/result.do")
	public ModelAndView resultHandler(ModelMap mmap, @RequestParam (required=false)int no ) {
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(today);
		mmap.put("date", date);
		
		List<Map> map = findRepository.getAllFind();
		mmap.put("map", map);
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/find/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/find/result.jsp");
		
		return mav;
	}
	
	@RequestMapping("/remove.do")
	public String removeHandler(int no) {
		
		int i = findRepository.removeByNo(no);
		System.out.println(i);
		if(i == 1) {
			return "redirect:/find/list.do";
		}else {
			return "main.find.detail";
		}
	}
}