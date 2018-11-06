package app.controller.help;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import app.models.HelpRepository;

@Controller
@RequestMapping("/help")
public class HelpController {

	@Autowired
	HelpRepository help;

	@Autowired
	ServletContext ctx;

	@RequestMapping("/list.do")
	public ModelAndView listHandler(ModelMap mmap, WebRequest wr, @RequestParam(required = false) String p) {
		Date day = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(day);

		mmap.put("today", today);

		Map map = new HashMap();
		int pp = (p == null) ? 1 : Integer.parseInt(p);
		
		mmap.put("current", pp);
		map.put("s", 1 + (pp - 1) * 10);
		map.put("e", pp * 10);

		List<Map> list = help.getSomeHelp(map);

		mmap.put("list", list);

		int tot = help.totalCount();
		mmap.put("size", tot/10 + (tot%10>0 ? 1: 0));
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/help/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/help/list.jsp");

		return mav;
	}

	@GetMapping("/write.do")
	public ModelAndView writeHandler() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/help/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/help/write.jsp");

		return mav;
	}

	@PostMapping("/write.do")
	public ModelAndView addHandler(@RequestParam Map rmap, @RequestParam MultipartFile inputfile1,
			@RequestParam MultipartFile inputfile2, ModelMap mmap, WebRequest wr)
			throws IOException, InterruptedException {

		//날짜 설정
		Date d = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		rmap.put("regdate", sdf.format(d));
		
		// 파일 첨부
		long time = System.currentTimeMillis();
		String fileName1 = String.valueOf(time) + "_" + inputfile1.getOriginalFilename();
		Thread.sleep(50);
		String fileName2 = String.valueOf(time) + "_" + inputfile2.getOriginalFilename();
		String path = ctx.getRealPath(String.valueOf(time));

		File dir = new File(path);

		if (!dir.exists()) {
			dir.mkdirs();
		}

		if (!inputfile1.isEmpty()) {
			File dst1 = new File(dir, fileName1);
			inputfile1.transferTo(dst1);
			String file1 = "/" + time + "/" + fileName1;
			rmap.put("inputfile1", file1);
		}

		if (!inputfile2.isEmpty()) {
			File dst2 = new File(dir, fileName2);
			inputfile2.transferTo(dst2);
			String file2 = "/" + time + "/" + fileName2;
			rmap.put("inputfile1", file2);
		}

		Map userInfo = (Map) wr.getAttribute("userInfo", WebRequest.SCOPE_SESSION);
		String nick = (String) userInfo.get("NICKNAME");

		rmap.put("nick", nick);

		System.out.println("rmap ? = " + rmap);
		ModelAndView mav = new ModelAndView();		
		try {
			int i = help.addAllHelp(rmap);
			System.out.println("i = " + i);
			mmap.put("map", rmap);
			
			
			mav.setViewName("redirect:/help/list.do");
			
			return mav;			

		} catch (Exception e) {
			e.printStackTrace();

			mav.setViewName("redirect:/help/write.do");
			
			return mav;	
		}
	}

	@GetMapping("/detail.do")
	public ModelAndView detailHandler(@RequestParam(required = false) int no, ModelMap mmap) {
		Date day = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(day);

		mmap.put("today", today);

		Map data = help.getOneByNo(no);
		mmap.put("data", data);

		System.out.println("detail mmap " + mmap);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/help/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/help/detail.jsp");

		return mav;
	}

}
