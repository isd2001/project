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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

import com.google.gson.Gson;

import app.models.ToCommentRepository;
import app.models.TogetherRepository;

@Controller
@RequestMapping("/together")
public class TogetherBoardController {
	@Autowired
	TogetherRepository together;
	@Autowired
	ToCommentRepository tocomment;
	@Autowired
	Gson gson;
	

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
			map.put("NICK", list.get(i).get("NICK"));
			map.put("DAY", sdf.format(list.get(i).get("DAY")));
			map.put("GOOD", list.get(i).get("GOOD"));
			map.put("LOOKUP", list.get(i).get("LOOKUP"));
			map.put("LATITUDE", list.get(i).get("LATITUDE"));
			map.put("LONGITUDE", list.get(i).get("LONGITUDE"));
			
			li.add(map);
		}
		System.out.println("li > "+li);
		wreq.setAttribute("list",li, WebRequest.SCOPE_REQUEST);

		return "main.togetherboard";
	}//end mainboard

	@RequestMapping("/selectboard.do")
	public String selsctboard(@RequestParam Map target,WebRequest wreq) {
		String area=(String)target.get("area");
		System.out.println("target>"+area);
		List<Map> list=together.getAllByArea(area);
		System.out.println("list > "+list);
		
		List<Map> li = new ArrayList<>();
		SimpleDateFormat sdf =new SimpleDateFormat("MM:dd");
		
		for (int i = 0; i < list.size(); i++) {
			String day=sdf.format(list.get(i).get("DAY"));
			list.get(i).put("day",day);
		}
		

		System.out.println("result > "+list);
		wreq.setAttribute("list", list, WebRequest.SCOPE_REQUEST);


		return "main.selectboard";
	}//end selectboard

	@GetMapping("/new.do")
	public String newGetboard() {
		return "main.newboard";
	}//end new


	@PostMapping("/new.do")
	public String newPostboard(@RequestParam Map map,WebRequest wreq) {
		Map info=(Map)wreq.getAttribute("userInfo", wreq.SCOPE_SESSION);
		String nick=(String)info.get("NICKNAME");
				
		String d=(String)map.get("day");
		String t =(String) map.get("time");		

		
		String total = d+" "+t;
		
		Map m = new HashMap<>();
		m.put("title", map.get("title"));
		m.put("content", map.get("content"));
		m.put("day", total);
		m.put("area", map.get("area"));
		m.put("latitude", map.get("latitude"));
		m.put("longitude", map.get("longitude"));
		m.put("address", map.get("address"));
		m.put("nick", nick);
		
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


	}//end new

	@GetMapping("/map2.do")
	public String map2GetHandle() {
		return "together.board/map2";
	}//end map2

	@GetMapping("/detail.do")
	public String detailHandle(@RequestParam Map map,WebRequest wreq) {
		Map info=(Map)wreq.getAttribute("userInfo", wreq.SCOPE_SESSION);
		String no = (String)map.get("no");
		String nick=(String)info.get("NICKNAME");
		//===============================================
		// lookup
		int t = together.updatelookup(no);
		// good
		
		
		//===============================================
		Map target=together.getOneByNo(no);

		List<Map> comment = tocomment.getCommentByNo(no);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		for (int i = 0; i < comment.size(); i++) {
			String day=sdf.format(comment.get(i).get("LEFTDATE"));
			comment.get(i).put("day",day);
		}

		wreq.setAttribute("comment", comment, WebRequest.SCOPE_REQUEST);
		wreq.setAttribute("list", target, WebRequest.SCOPE_REQUEST);
		return "main.detail";
		
	}//end detail

	
	@PostMapping("/detail.do")
	public String detailPostHandle(@RequestParam Map param,WebRequest wreq) {
		Map info=(Map)wreq.getAttribute("userInfo", wreq.SCOPE_SESSION);
		
		String nick=(String)info.get("NICKNAME");
		String ment = (String)param.get("comment");
		String cno=(String)param.get("no");
		Date leftdate = new Date();
		Map input = new HashMap<>();
			input.put("cno", cno);
			input.put("ment", ment);
			input.put("leftdate", leftdate);
			input.put("nick", nick);
		try {
			int result = tocomment.addComment(input);
			if (result==1) {
				return "redirect:/together/detail.do?no="+cno;
			}else {
				return "redirect:/together/detail.do?no="+cno;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	
	}//end detail.do
	
	@GetMapping("good.do")
	public String goodPostHandle(@RequestParam Map param,WebRequest wr) {
		String no=(String)param.get("no");
		System.out.println("no !!>"+no);
		int result=together.updategood(no);		
		
		wr.setAttribute("no", no, wr.SCOPE_REQUEST);
		return "redirect:/together/detail.do";
	}//end good.do
	
	
	@GetMapping("ajax.do")
	@ResponseBody
	public String ajaxHandle(@RequestParam Map param) {
		System.out.println("param > "+param);
		String no = (String)param.get("no");
				
		String mode = (String)param.get("mode");
		if (mode.equals("good")) {
			int result= together.updategood(no);
			Map goodajax=together.getGoodByNo(no);
			System.out.println("goodajax>>"+goodajax);
			return gson.toJson(goodajax); 
		}
		return "";
	}//end ajax;
	
}
