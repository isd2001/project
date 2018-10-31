package app.controller.index;

import java.util.*;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.WebRequest;

@Controller("/mypage")
public class MyPageController {

	@RequestMapping("/mypage.do")
	public String indexHandle(WebRequest wr) {
		Map user = (Map)wr.getAttribute("userInfo", wr.SCOPE_SESSION);
		return "mypage.index";
	}
	
}
