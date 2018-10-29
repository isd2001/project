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
	
//end class


public List<Map> getAllnboard(){
	return template.selectList("member_board.getAllnboard");
}
}//end getAllNboard
