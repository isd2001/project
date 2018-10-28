package app.models;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TogetherRepository {
	@Autowired
	SqlSessionTemplate template;
	
	//전체 리스 출력
	public List<Map> getAllTogether(){
		return template.selectList("together.getAllTogether");
	}
	
	//글 올리기
	public int addTogetherBoard(Map map) {
		return template.insert("together.addTogetherBoard",map);
	}
	
	public Map getOneByNo(String no) {
		return template.selectOne("together.getOneByNo",no);
	}
	
	
}
