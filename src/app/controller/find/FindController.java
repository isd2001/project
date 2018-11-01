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

import app.models.FindRepository;
import app.models.accountRepository;

@Controller
@RequestMapping("/find")
public class FindController {

	@Autowired
	ServletContext ctx;

	@Autowired
	FindRepository findRepository;

	// 게시글 List 화면

	@GetMapping("/list.do")
	public String listNeoHandler(ModelMap mmap, WebRequest wr, @RequestParam (required=false)String p) {
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(today);
		mmap.put("date", date);
		
		Map user = (Map)wr.getAttribute("userInfo", WebRequest.SCOPE_SESSION);
		String nick = (String)user.get("NICKNAME");
		mmap.put("nick", nick);
		//-------------------------------------
		Map map = new HashMap();
		int pp = (p == null) ? 1 : Integer.parseInt(p);
		
		map.put("s", 1 + (pp-1) * 6);
		map.put("e", pp*6);
		
		List<Map> every = findRepository.getSomeFind(map);
		mmap.put("every",every);
		
		return "main.find.list";
	}
/*
	public String listHandler(ModelMap mmap, WebRequest wr, @RequestParam (required=false)String nick) {
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(today);

		nick = (String)wr.getAttribute("nick", WebRequest.SCOPE_SESSION);
		
		System.out.println("nick = " + nick);
		mmap.put("nick", nick);
		mmap.put("date", date);
		
		System.out.println(mmap);

		//-------------------------------------

		List<Map> every = findRepository.getAllFind();
		System.out.println(every);
		mmap.put("every",every);
		
		return "main.find.list";
	}
*/
	@GetMapping("/write.do")
	public String writeHandler() {
		
		return "main.find.write";
	}
	
	// 게시글 write 화면
	@PostMapping("/start.do")
	public String startHandler(@RequestParam Map rmap, @RequestParam MultipartFile picture,
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
			return "main.find.result";
		}catch(Exception e) {
			e.printStackTrace();
			return "main.find.write";
		}

	}

	@RequestMapping("/detail.do")
	public String detailHandler(@RequestParam (required=false)int no, ModelMap mmap) {	
		
		Map data = findRepository.getByNo(no);
		mmap.put("data", data);
		
		return "main.find.detail";
	}
	
	@RequestMapping("/result.do")
	public String resultHandler(ModelMap mmap, @RequestParam (required=false)int no ) {
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(today);
		mmap.put("date", date);
		
		List<Map> map = findRepository.getAllFind();
		mmap.put("map", map);
				
		return "main.find.result";
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