package app.models;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

	
	@Repository
	public class dogtrainingRepository{
		
		@Autowired
		SqlSessionTemplate template;
		
		//전체 리스트 출력
		public List<Map> getAlldt(){
			return template.selectList("DTBOARD.getAlldt");
		} // end getAlldt
		
		//글 상세보기
		public Map readdt(int NUM) {
			return template.selectOne("DTBOARD.readdt" , NUM);
		} // end readdt
		
		// 글쓰기 저장
		public int adddtboard(Map map) {
			return template.insert("DTBOARD.adddtboard" , map);
		}
		
		//댓글 저장
		public int addcomment(Map param	) {
			return template.insert("DCOMMENT.addcomment" , param);
		}
		
		// 게시글 댓글 전부뽑는거
		public List<Map> readcomment(int BOARD){
			return template.selectOne("DCOMMENT.readcomment" , BOARD);
		}
		
		
		
	}
	



