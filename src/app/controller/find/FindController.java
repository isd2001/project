package app.controller.find;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
	public String listHandler(ModelMap mmap) {
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(today);

		mmap.put("date", date);

		//-------------------------------------

		List<Map> every = findRepository.getAllFind();
		mmap.put("every",every);
		
		return "main.find.list";
	}

	@GetMapping("/write.do")
	public String writeHandler() {
		
		return "main.find.write";
	}
	
	// 게시글 write 화면
	@PostMapping("/start.do")
	public String startHandler(@RequestParam Map rmap, @RequestParam MultipartFile findFile,
			ModelMap mmap) throws IOException {
		System.out.println(rmap);
		System.out.println(findFile);
		long time = System.currentTimeMillis();
		// 파일 첨부
		String fileName = String.valueOf(time) + "_" + findFile.getOriginalFilename();
		System.out.println(fileName);
		String path = ctx.getRealPath(String.valueOf(time));
		
		File dir = new File(path);

		if (!dir.exists()) {
			dir.mkdirs();
		}
		File dst = new File(dir, fileName);

		findFile.transferTo(dst);
		
		String attachfile = "/" + time + "/" + fileName;
						
		rmap.put("attachfile", attachfile);
		
		int r = findRepository.addAllFind(rmap);
		if(r==1) {
			return "main.find.result";
		}else {
			return "main.find.write";
		}
	}

	@RequestMapping("/detail.do")
	public String detailHandler(@RequestParam int no, ModelMap map) {
		Map data = findRepository.getByOne(no);
		map.put("data", data);
		
		return "main.find.detail";
	}
}