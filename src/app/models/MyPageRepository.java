package app.models;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageRepository {

	@Autowired
	SqlSessionTemplate template;
	
	// 비밀번호 추출
	public String getByPassWord(String id) {
		return template.selectOne("gaenoljaaccount.getByPassWord", id);
	}
	
	// 비밀번호 수정
	public int updatePassWord(Map idpass) {
		return template.update("gaenoljaaccount.updatePassWord", idpass);
	}
	
	// 회원정보 수정
	public int updateUserInfo(Map userInfo) {
		return template.update("gaenoljaaccount.updateUserInfo", userInfo);
	}
	
	// 분양게시판 아이디 별로 가져오기
	public List<Map> getByParcelList(String writer) {
		return template.selectList("parcel.getByParcelList", writer);
	}
}
