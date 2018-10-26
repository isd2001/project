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
	@RequestMapping("/list.do")
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

	// 게시글 write 화면
	@RequestMapping("/write.do")
	public String writeHandler(@RequestParam Map rmap, @RequestParam MultipartFile file,
			ModelMap mmap) throws IOException {
		long time = System.currentTimeMillis();
		// 파일 첨부
		String fileName = String.valueOf(time) + "_" + file.getOriginalFilename();
		System.out.println(fileName);
		String path = ctx.getRealPath(String.valueOf(time));
		
		File dir = new File(path);

		if (!dir.exists()) {
			dir.mkdirs();
		}
		File dst = new File(dir, fileName);

		file.transferTo(dst);
		
		String attachfile = "/" + time + "/" + fileName;
		
		rmap.put("attachfile", attachfile);
		
		return "main.find.write";
	}

	@RequestMapping("/detail.do")
	public String detailHandler(@RequestParam int no, ModelMap map) {
		Map data = findRepository.getByOne(no);
		map.put("data", data);
		
		return "main.find.detail";
	}
}