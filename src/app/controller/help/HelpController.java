package app.controller.help;

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
	public String listHandler(ModelMap mmap, WebRequest wr, @RequestParam (required=false)String p) {
		Date day = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(day);

		mmap.put("today", today);

		Map map = new HashMap();
		int pp = (p == null) ? 1 : Integer.parseInt(p);

		map.put("s", 1 + (pp - 1) * 10);
		map.put("e", pp * 10);

		List<Map> h = help.getSomeHelp(map);
		mmap.put("help", h);

		return "help.list";
	}

	@GetMapping("/write.do")
	public String writeHandler() {

		return "help.write";
	}

	@RequestMapping("/add.do")
	public String addHandler(@RequestParam Map rmap, @RequestParam MultipartFile inputfile1, @RequestParam MultipartFile inputfile2,
			ModelMap mmap, WebRequest wr) throws IOException {

		// 파일 첨부
		long time = System.currentTimeMillis();
		String fileName1 = String.valueOf(time) + "_" + inputfile1.getOriginalFilename();
		String fileName2 = String.valueOf(time) + "_" + inputfile2.getOriginalFilename();
		String path = ctx.getRealPath(String.valueOf(time));

		File dir = new File(path);

		if (!dir.exists()) {
			dir.mkdirs();
		}
		File dst = new File(dir, fileName1);

		inputfile1.transferTo(dst);
		inputfile2.transferTo(dst);

		String file1 = "/" + time + "/" + fileName1;
		String file2 = "/" + time + "/" + fileName2;
		
		rmap.put("inputfile1", file1);
		rmap.put("inputfile2", file2);	
		rmap.put("writer","까치");
		rmap.put("regdate", "11111111");
	
		System.out.println(rmap);
		
		try {
			int i = help.addAllHelp(rmap);
			System.out.println("i = " + i);	
			mmap.put("map", rmap);
			
			return "help.result";
		}catch(Exception e) {
			e.printStackTrace();
	
			return "help.write";
		}
	}
	
	@RequestMapping("/detail.do")
	public String resultHandler(@RequestParam (required=false)int no, ModelMap mmap) {
		
		Map data = help.getOneByNo(no);
		mmap.put("data", data);
		
		return "help.detail";
	}

	@RequestMapping("/result.do")
	public String resultHandler(ModelMap mmap, @RequestParam (required=false)int no) {
		
		List<Map> map = help.getAllHelp();
		mmap.put("map", map);
		
		return "help.result";
	}
}
