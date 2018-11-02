package app.models;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class searchRepository {

	@Autowired
	SqlSessionTemplate template;
	
	public List<Map> resultForSearchFromFindTitle(String search) {
		return template.selectList("find.resultForSearchFromFind", "%"+search+"%");
	}
	
	public List<Map> resultForSearchFromParcelTitle(String search) {
		return template.selectList("parcel.resultForSearchFromParcel", "%"+search+"%");
	}
	
	public List<Map> resultForSearchFromDogList(String search) {
		return template.selectList("dogList.resultForSearchFromDogList", "%"+search+"%");
	}
	

}
