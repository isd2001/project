package app.models;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class accountRepository {
	
	@Autowired
	SqlSessionTemplate template;

	
	public int addAccount(Map map) {
		return template.insert("gaenoljaaccount.addAccount", map);
	}
	
	
	public List<Map> getAllAccount() {
		return template.selectList("gaenoljaaccount.getAllaccount");
	}
	
	public Map getOneById(String id) {
		return template.selectOne("gaenoljaaccount.getOneById",id);
	}
	
	public boolean getPwById(Map loginInfo) {
		return loginInfo.get("pw").equals(template.selectOne("gaenoljaaccount.getPwById", loginInfo.get("id")));
	}
	
	public Map getUserInfo(String id) {
		return template.selectOne("gaenoljaaccount.getUserInfo", id);
	}
	
	public String checkId(String id) {
		return template.selectOne("gaenoljaaccount.checkId", id);
	}
	
	public String checkNick(String nickname) {
		return template.selectOne("gaenoljaaccount.checkNick", nickname);
	}
}
