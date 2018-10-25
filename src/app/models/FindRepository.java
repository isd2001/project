
package app.models;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class FindRepository {

	@Autowired
	SqlSessionTemplate template;
	
//	//게시글 작성(전부 넣기)
//	public int addWrite(Map map) {
//		return "template.";
//	}
//	
//	//게시글에서 빼기 (전부)
//	public List<Map> removeWrite(){
//		return "template.";
//	}
//	
//	//게시글 수정
//	public int update(Map map){
//		return "template.";
//	}
//
//	//특정 데이터 뽑기
//	public Map getByOne(int no) {
//		return "template.";
//	}
//	
//	
//	
}