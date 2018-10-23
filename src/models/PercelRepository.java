package models;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PercelRepository {
// 지금은 테스트 DB로 설정해놈. 나중에 최종적으로 붙일때 DB 테이블 명 변경해야 함.
// 현재 DB 테이블 셋팅은 issue 임.
	@Autowired
	SqlSessionTemplate template;

	// 게시글 작성하는거
	public int addByPercel(Map map) {
		return template.insert("issue.addByPercel", map);
	}
	
	// 게시글 전부 뽑는거
	public List<Map> getAllByPercel() {
		return template.selectList("issue.getAllByPercel");
	}
	
	// 특정 게시글 데이터 뽑는거
	public Map getByOnePercel(int no) {
		return template.selectOne("issue.getByOnePercel", no);
	}
	
	// 댓글 저장하는거
	public int addByComments() {
		return template.insert("opinion.addByComments");
	}
	
	// 특정 게시글 댓글 전부 뽑는거(오름차순)
	public List<Map> getAllByComments(int no) {
		return template.selectList("opinion.getAllByComments", no);
	}
	
	// 특정 게시글 댓글의 댓글 뽑는거
//	public List<Map> getAllByComments(String code) {
//		return template.selectList("", code);
//	}
}
