package app.controller.find;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

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

@Controller
@RequestMapping("/find")
public class FindController {

	@Autowired
	ServletContext ctx;
	@GetMapping("/list.do")
	public String listHandler() {
		
		return "main.find.list";
	}
	
	@PostMapping("/list.do")	
	public String listHandler(@RequestParam String param, @RequestParam MultipartFile attach, WebRequest wr) throws IOException {

		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(today);
	
		wr.setAttribute("date", date, WebRequest.SCOPE_SESSION);
		
		
		System.out.println("param =" + param);
		System.out.println("attach = " + param);
		
		String fileName = attach.getOriginalFilename();
		
		String path = ctx.getRealPath("C:");
		System.out.println(path);
		File dir = new File(path);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		File dst= new File(dir, fileName);
		
		return "main.find.list";
	}
	
	@GetMapping("/write.do")
	public String writeHandler() {
		
		return "main.find.write";
	}
	
	@PostMapping("/write.do")
	public String writeHandler(WebRequest wr) {
		
		return "main.find.write";
	}
}