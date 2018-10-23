package app.controller.index;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import models.PercelRepository;

@Controller
public class ParcelController {

	@Autowired
	PercelRepository percelRepository;
	
	// 분양게시판 index 페이지 게시물 전체 뽑아서 보여줌
	@RequestMapping("/percel.do")
	public String getAllByPercel() {
		List<Map> list = percelRepository.getAllByPercel();
		return "percel.index";
	}
	
	@RequestMapping("/new.do")
	public String newHandler() {
		return "new";
	}
	
	@RequestMapping("/add.do")
	public String addByPercelHandler(@RequestParam Map map, ModelMap data) {
		int r = percelRepository.addByPercel(map);
		if(r > 0) {
			String title = (String)map.get("title");
			String con = (String)map.get("title");
		}
		return "percel.new";
	}
}
