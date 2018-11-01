package app.controller.mypage;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.WebRequest;

import app.models.MyPageRepository;

@Controller("/mypage")
public class MyPageController {
	
	@Autowired
	MyPageRepository myPageRepository;

	@RequestMapping("/mypage.do")
	public String indexHandle(WebRequest wr, ModelMap map) {
		Map userInfo = (Map)wr.getAttribute("userInfo", wr.SCOPE_SESSION);
			map.put("userInfo", userInfo);
		return "mypage.index";
	}
	
	@RequestMapping("/myboard.do")
	public String myboardHandle(WebRequest wr, ModelMap map) {
		Map userInfo = (Map)wr.getAttribute("userInfo", wr.SCOPE_SESSION);
		String writer = (String)userInfo.get("ID");
		List parcelList = myPageRepository.getByParcelList(writer);
			map.put("parcelList", parcelList);
		
		return "mypage.myboard";
	}
	
	@RequestMapping("/mycomment.do")
	public String myCommentHandle() {
		return "mypage.mycomment";
	}
}
