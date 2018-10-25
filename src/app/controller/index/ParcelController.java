package app.controller.index;

import java.io.File;
import java.io.IOException;
import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;

import models.ParcelRepository;

@Controller
public class ParcelController {

	@Autowired
	ServletContext ctx;
	
	@Autowired
	ParcelRepository percelRepository;
	
	// 분양게시판 index 페이지 게시물 전체 뽑아서 보여줌 / 게시물 리스트 출력 핸들러
	@RequestMapping("/percel.do")
	public String getAllByPercel(ModelMap map) {
		List<Map> list = percelRepository.getAllByPercel();
		map.put("list", list);
		System.out.println(map);
		return "parcel.index";
	}
	
	// 새글쓰기 뷰어 출력 핸들러
	@RequestMapping("/new.do")
	public String newHandler() {
		return "parcel.new";
	}
	
	// 새글쓰기 저장 핸들러
	@RequestMapping("/add.do")
	public String addByPercelHandler(@RequestParam Map param, @RequestParam MultipartFile mainimage, @RequestParam MultipartFile file1, @RequestParam MultipartFile file2, ModelMap map) throws IOException {
		
		String mainfileName = String.valueOf(System.currentTimeMillis()) + "_" + mainimage.getOriginalFilename();
		String file1Name = String.valueOf(System.currentTimeMillis()) + "_" + file1.getOriginalFilename();
		String file2Name = String.valueOf(System.currentTimeMillis()) + "_" + file2.getOriginalFilename();
	//	long d = System.currentTimeMillis();
	//	String t = String.
		String path = ctx.getRealPath(String.valueOf(System.currentTimeMillis()));
		File dir = new File(path);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		File dst = new File(dir, mainfileName);
		File dst1 = new File(dir, file1Name);
		File dst2= new File(dir, file2Name);
		mainimage.transferTo(dst);
		file1.transferTo(dst1);
		file2.transferTo(dst2);
		
		System.out.println(dst);
		System.out.println(dst1);
		System.out.println(dst2);
		
		param.put("mainimage", dst.toString());
		param.put("file1", dst1.toString());
		param.put("file2", dst2.toString());
		System.out.println(param);
		
		try {
			int r = percelRepository.addByPercel(param);
			return "parcel.result";
		}catch(Exception e) {
			e.printStackTrace();
			map.put("err", "on");
			return "parcel.new";
		}
		
	}
	
	@RequestMapping("/detail.do")
	public String getByOnePercel(@RequestParam int no, ModelMap one) {
		Map onedata = percelRepository.getByOnePercel(no);
		one.put("one", onedata);
		return "parcel.detail";
	}
}
