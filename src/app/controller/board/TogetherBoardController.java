package app.controller.board;


import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;

import app.models.ToCommentRepository;
import app.models.TogetherRepository;

@Controller
@RequestMapping("/together")
public class TogetherBoardController {
	@Autowired
	TogetherRepository together;
	@Autowired
	ToCommentRepository tocomment;

	@GetMapping("/mainboard.do")
	public String mainboard(WebRequest wreq,@RequestParam Map param) {
		String re=(String)wreq.getAttribute("result",WebRequest.SCOPE_REQUEST);
		if (re=="on") {
			wreq.setAttribute("result","yes",WebRequest.SCOPE_REQUEST);
		}
		//------------------------------------------------
		List<Map> list=together.getAllTogether();
		System.out.println("list > "+list);

		List<Map> li = new ArrayList<>();

		SimpleDateFormat sdf= new SimpleDateFormat("MM-dd");

		for (int i = 0; i < list.size(); i++) {
			Map map = new HashMap<>();
			map.put("NO", list.get(i).get("NO"));
			map.put("AREA", list.get(i).get("AREA"));
			map.put("TITLE", list.get(i).get("TITLE"));
			map.put("DAY", sdf.format(list.get(i).get("DAY")));
			map.put("GOOD", list.get(i).get("GOOD"));
			map.put("LOOKUP", list.get(i).get("LOOKUP"));
			li.add(map);
		}
		System.out.println("li > "+li);
		wreq.setAttribute("list",li, WebRequest.SCOPE_REQUEST);

		return "main.togetherboard";
	}

	@GetMapping("/selectboard.do")
	public String selsctboard(@RequestParam Map target) {
		String area=(String)target.get("area");

		System.out.println("target>"+area);

		return "main.selectboard";
	}

	@GetMapping("/new.do")
	public String newGetboard() {
		return "main.newboard";
	}


	@PostMapping("/new.do")
	public String newPostboard(@RequestParam Map map,WebRequest wreq) {
		String d=(String)map.get("day");
		String t =(String) map.get("time");		
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm");


		Map m = new HashMap<>();
		m.put("title", map.get("title"));
		m.put("content", map.get("content"));
		m.put("day", d);
		m.put("area", map.get("area"));
		m.put("latitude", map.get("latitude"));
		m.put("longitude", map.get("longitude"));
		m.put("address", map.get("address"));
		System.out.println("정보 >"+m);		

		try {
			int result=together.addTogetherBoard(m);
			System.out.println("result >"+result);
			if (result==1) {
				wreq.setAttribute("result","on", WebRequest.SCOPE_REQUEST);
				return "redirect:/together/mainboard.do";
			}else {
				wreq.setAttribute("result","off", WebRequest.SCOPE_REQUEST);
				return "main.newboard";

			}

		} catch (Exception e) {
			e.printStackTrace();
			wreq.setAttribute("result","no", WebRequest.SCOPE_REQUEST);
			return "main.newboard";
		}


	}

	@GetMapping("/map2.do")
	public String map2GetHandle() {
		return "together.board/map2";
	}

	@GetMapping("/detail.do")
	public String detailHandle(@RequestParam Map map,WebRequest wreq) {
		String no = (String)map.get("no");
		Map target=together.getOneByNo(no);
		
		List<Map> comment = tocomment.getCommentByNo(no);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				
		for (int i = 0; i < comment.size(); i++) {
			String day=sdf.format(comment.get(i).get("LEFTDATE"));
			comment.get(i).put("day",day);
		}
		
		wreq.setAttribute("comment", comment, WebRequest.SCOPE_REQUEST);
		wreq.setAttribute("list", target, WebRequest.SCOPE_REQUEST);
		return "main.detile";
	}
	
	@PostMapping("/detail.do")
	public String detailPostHandle(@RequestParam Map param) {
		System.out.println("param >"+param);
		String commnet = (String)param.get("comment");
		
		
		
		return "";
	}//end
}
