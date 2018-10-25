package app.controller.find;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/find")
public class FindController {

	@Autowired
	ServletContext ctx;
	@GetMapping("/list.do")
	public String listHandler(ModelMap mmap) {
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(today);
	
		mmap.put("date", date);
		
		return "main.find.list";
	}
	
	@PostMapping("/list.do")	
	public String listHandler(@RequestParam (required=false)String param,@RequestParam (required=false)MultipartFile findFile, ModelMap mmap) throws IOException {
		
		String fileName = findFile.getOriginalFilename();
		System.out.println(fileName);
		String path = ctx.getRealPath("/storage");
		
		File dir = new File(path);
		
		if(!dir.exists()) {
			dir.mkdirs();
		}
		File dst= new File(dir, fileName);
		
		mmap.put("dir",dir);		
		return "main.find.list";
	}
	
	@GetMapping("/write.do")
	public String writeHandler(ModelMap mmap) {
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(today);
	
		mmap.put("date", date);
		return "main.find.write";
	}
	
	@PostMapping("/detail.do")
	public String detailHandler(WebRequest wr) {
		
		return "main.find.detail";
	}
}