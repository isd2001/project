
package app.models;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FindRepository {

	@Autowired
	SqlSessionTemplate template;
	
	//게시글 작성(전부 넣기)
	public int addAllFind(Map map) {
		return template.insert("find.addAllFind", map);
	}
	
	//모든 게시글 내용 뽑기
	public List<Map> getAllFind(){
		return template.selectList("find.getAllFind");
	}

	//no로 데이터 뽑기
	public Map getByOne(int no) {
		return template.selectOne("find.getOneByNo", no);
	}
	
	
	
}