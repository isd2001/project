package app.models;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class MyPageRepository {

	@Autowired
	SqlSessionTemplate template;
	
	// 비밀번호 추출
	public String getByPassWord(String id) {
		return template.selectOne("gaenoljaaccount.getByPassWord", id);
	}
	
	// 비밀번호 수정
	public int updatePassWord(Map userInfo) {
		return template.update("gaenoljaaccount.updatePassWord", userInfo);
	}
	
	// 회원정보 수정
	public int updateUserInfo(Map userInfo) {
		return template.update("gaenoljaaccount.updateUserInfo", userInfo);
	}
}
