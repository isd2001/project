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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;

import app.models.ParcelRepository;

@Controller
public class ParcelController {

	@Autowired
	ServletContext ctx;
	
	@Autowired
	ParcelRepository percelRepository;
	
	// 분양게시판 index 페이지 게시물 전체 뽑아서 보여줌 / 게시물 리스트 출력 핸들러
	@RequestMapping("/percel.do")
	public String getAllByPercel() {
		List<Map> list = percelRepository.getAllByPercel();
		return "parcel.index";
	}
	
	// 새글쓰기 뷰어 출력 핸들러
	@RequestMapping("/new.do")
	public String newHandler() {
		return "parcel.new";
	}
	
	// 새글쓰기 저장 핸들러
	@RequestMapping("/add.do")
	public String addByPercelHandler(@RequestParam Map param,@RequestParam MultipartFile mainimage, @RequestParam MultipartFile file1, @RequestParam MultipartFile file2, ModelMap map) throws IOException {
		
		String mainfileName = mainimage.getOriginalFilename();
		String file1Name = file1.getOriginalFilename();
		String file2Name = file2.getOriginalFilename();
		String path = ctx.getRealPath("c://storage1");
		File dir = new File(path);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		File dst = new File(dir, mainfileName);
		File dst1 = new File(dir, file1Name);
		File dst2= new File(dir, file2Name);
		mainimage.transferTo(dst);
		mainimage.transferTo(dst1);
		mainimage.transferTo(dst2);
		
		param.put("mainimage", dst);
		param.put("file1", dst1);
		param.put("file2", dst2);
		
		// 위도 경도는 우선 null값으로 디폴트 put 처리해서 처리 추후 지도 추가시 수정
	//	param.put("lat", "null");
	//	param.put("longi", "null");
		
		try {
			int r = percelRepository.addByPercel(param);
			return "parcel.result";
		}catch(Exception e) {
			e.printStackTrace();
			map.put("err", "on");
			return "parcel.new";
		}
		
		
	}
}
