package app.models;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NboardRepository {

	@Autowired
	SqlSessionTemplate template;
	
	// 전체 공지사항 출력
	public List<Map> getAllNboard(){
		return template.selectList("member_board.getAllNboard");
	}//end getAllNboard	
	
	// 글쓰기 저장
	public int addlistBoard(Map map) {
		return template.insert("member_board.addlistBoard",map);
	}
	
	//글 상세보기
	public Map nboardread(int BOARD_NUM) {
		return template.selectOne("member_board.nboardread" , BOARD_NUM);
	}
	
	public List<Map> getAllnboard(){
		return template.selectList("member_board.getAllnboard");
	}

	
	
}

