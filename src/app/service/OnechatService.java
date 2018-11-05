package app.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.google.gson.Gson;

@Service
public class OnechatService {

	public List<WebSocketSession> list;

	@Autowired
	Gson gson;

	public OnechatService() {
		list = new ArrayList<>();
	}
	// 사이즈
	public int size() {
		return list.size();
	}

	// 추가
	public boolean addSocket(WebSocketSession session) {
		return list.add(session);
	}
	//삭제
	public boolean removeSocket(WebSocketSession session) {
		return list.remove(session);
	}

	// 작성한것들 보내기
	public void sendWrite(String text) {
		TextMessage msg = new TextMessage(text);
		for(int i=0; i < list.size(); i++) {
			try{
				list.get(i).sendMessage(msg);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}


}