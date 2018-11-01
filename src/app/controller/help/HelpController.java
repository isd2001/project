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

import app.models.HelpRepository;

@Controller
@RequestMapping("/help")
public class HelpController {

	@Autowired
	HelpRepository help;

	@Autowired
	ServletContext ctx;

	@RequestMapping("/list.do")
	public String listHandler(ModelMap mmap, WebRequest wr, @RequestParam(required = false) String p) {
		Date day = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(day);

		mmap.put("today", today);

		Map map = new HashMap();
		int pp = (p == null) ? 1 : Integer.parseInt(p);

		map.put("s", 1 + (pp - 1) * 6);
		map.put("e", pp * 6);

		List<Map> h = help.getSomeHelp(map);
		mmap.put("help", h);

		return "help.list";
	}

	@GetMapping("/write.do")
	public String writeHandler() {

		return "help.write";
	}

	@RequestMapping("/add.do")
	public String addHandler(@RequestParam Map rmap, @RequestParam MultipartFile file, ModelMap mmap, WebRequest wr)
			throws IOException {

		// 파일 첨부
		long time = System.currentTimeMillis();
		String fileName = String.valueOf(time) + "_" + file.getOriginalFilename();
		System.out.println(fileName);
		String path = ctx.getRealPath(String.valueOf(time));

		File dir = new File(path);

		if (!dir.exists()) {
			dir.mkdirs();
		}
		File dst = new File(dir, fileName);

		file.transferTo(dst);

		String pictureName = "/" + time + "/" + fileName;
		rmap.put("picture", pictureName);

		return "help.detail";
	}

	@RequestMapping("/result.do")
	public String resultHandler() {
		return "help.result";
	}
}
