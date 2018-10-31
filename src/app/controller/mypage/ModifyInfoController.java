package app.controller.mypage;

import java.io.File;
import java.io.IOException;
import java.util.*;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;

import app.models.MyPageRepository;
import app.models.accountRepository;

@Controller
public class ModifyInfoController {
	
	@Autowired
	ServletContext ctx;
	
	@Autowired
	MyPageRepository myPageRepository;
	
	@Autowired
	accountRepository ar;
	
	// 수정처리 요청시 중간 인증 체크 핸들
	// 정상 로그인 후 인증세션이 있으면 check.do 부분에 인증 유무에 따른 페이지 변환이 우선적으로 들어가야 함.
	@RequestMapping("check.do")
	public String authCherckHandle(@RequestParam String mode ,WebRequest wr) {
		switch(mode) {
		case "memberInfo" : 
			wr.setAttribute("mode", "memberInfo", wr.SCOPE_SESSION);
			break;
		case "password" : 
			wr.setAttribute("mode", "password", wr.SCOPE_SESSION);
			break;
		}
		return "mypage.check";
	}
	
	@RequestMapping("/sort.do")
	public String checkPassHandle(WebRequest wr, @RequestParam String param, ModelMap map) {
		String mode = (String)wr.getAttribute("mode", wr.SCOPE_SESSION);
		Map data = (Map)wr.getAttribute("userInfo", wr.SCOPE_SESSION);
		String id = (String)data.get("ID");
		String pass = myPageRepository.getByPassWord(id);
		
		if(param.equals(pass) && mode.equals("memberInfo")) {
			return "redirect:/modify_info.do";
		}else if(param.equals(pass) && mode.equals("password")) {
			return "redirect:/modify_pw.do";
		}else {
			map.put("err", "on");
			return "mypage.check";
		}
		
	}

	// 비밀번호 수정 페이지 핸들러
	@RequestMapping("/modify_pw.do")
	public String modifyPasswordHandle() {
		return "mypage.modify_pw";
	}
	
	// 비밀번호 업데이트
	@RequestMapping("/change_pw.do")
	public String updatePassWord(@RequestParam Map param, WebRequest wr, ModelMap map) {
		Map data = (Map)wr.getAttribute("userInfo", wr.SCOPE_SESSION);
		String id = (String)data.get("ID");
		String originpass = (String)param.get("originpass");
		String pass = myPageRepository.getByPassWord(id);
		
		if(originpass.equals(pass)) {
			Map idpass = new HashMap<>();
				idpass.put("id", id);
				idpass.put("pass", param.get("newpass"));
			int r = myPageRepository.updatePassWord(idpass);
			if(r == 1) {
				wr.removeAttribute("mode", wr.SCOPE_SESSION);
			}
			return "mypage.index";
		}else {
			map.put("err", "on");
			return "mypage.modify_pw";
		}
	}
	
	// 회원정보 수정 핸들
	@RequestMapping("/modify_info.do")
	public String modifyMemberInfoHandle(WebRequest wr, @RequestParam Map param, ModelMap map) {
		return "mypage.modify_info";
	}
	
	// 회원정보 업데이트
	@RequestMapping("/change_info.do")
	public String updateUserInfo(@RequestParam Map param, WebRequest wr, MultipartFile dogProfile, ModelMap map ) throws IOException{
		Map data = (Map)wr.getAttribute("userInfo", wr.SCOPE_SESSION);
		String id = (String)data.get("ID");
			param.put("id", id);
		long time = System.currentTimeMillis();
		String add = (String) param.get("address");
		String add2= (String) param.get("address2");
		String address = add+add2;
			param.put("address", address );
			param.remove("address2");
		
		String dogProfileName = String.valueOf(time) + "_" + dogProfile.getOriginalFilename();

		String path = ctx.getRealPath(String.valueOf(time));
		
		File dir = new File(path);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		File dst = new File(dir, dogProfileName);		
		dogProfile.transferTo(dst);
		
		String attachDogProfile = "/" + time + "/" + dogProfileName;
			param.put("dogProfile", attachDogProfile);
		
		try {
			int r = myPageRepository.updateUserInfo(param);
			if(r == 1) {
				Map userInfo = ar.getUserInfo(id);
				wr.setAttribute("userInfo", userInfo, wr.SCOPE_SESSION);
				wr.removeAttribute("auth_check", wr.SCOPE_SESSION);
				wr.removeAttribute("mode", wr.SCOPE_SESSION);
			}
			return "mypage.index";
		}catch(Exception e) {
			e.printStackTrace();
			map.put("err","on");
			return "mypage.modify_info";
		}
		
	}
	
	

}
