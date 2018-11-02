package app.models;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DogHospitalRepository {

	@Autowired
	SqlSessionTemplate template;
	
	// 특정 지역구 병원 출력
	public List<Map> getDogHospitalByGu(String param) {
		return template.selectList("animalhospital.getDogHospitalByGu", param);
	}
}
