package models;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ParcelRepository {
// 지금은 테스트 DB로 설정해놈. 나중에 최종적으로 붙일때 DB 테이블 명 변경해야 함.
// 현재 DB 테이블 셋팅은 issue 임.
	@Autowired
	SqlSessionTemplate template;

	// 게시글 작성하는거
	public int addByPercel(Map map) {
		return template.insert("parcel.addByPercel", map);
	}
	
	// 게시글 전부 뽑는거
	public List<Map> getAllByPercel() {
		return template.selectList("parcel.getAllByPercel");
	}
	
	// 특정 게시글 데이터 뽑는거
	public Map getByOnePercel(int no) {
		return template.selectOne("parcel.getByOnePercel", no);
	}
	
	// 댓글 저장하는거
	public int addByComments(Map param) {
		return template.insert("comments.addByComments", param);
	}
	
	// 특정 게시글 댓글 전부 뽑는거(오름차순)
	public List<Map> getAllByComments(int ino) {
		return template.selectList("comments.getAllByComments", ino);
	}
	
	// 특정 게시글 댓글의 댓글 뽑는거
//	public List<Map> getAllByComments(String code) {
//		return template.selectList("", code);
//	}
	
	// 리댓글 저장하는거
	public int addByReComments(Map param) {
		return template.insert("recomments.addByReComments", param);
	}
	
	// 특정 댓글의 리댓글 내용 뽑는거
	public List<Map> getAllByReComments(String code) {
		return template.selectList("recomments.getAllByReComment", code);
	}
}
