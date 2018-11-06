package app.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.google.gson.Gson;

import app.controller.index.OneChatSocketController;

@Service
public class OnechatService {	
	   
	public List<WebSocketSession> chatConnectedUsers;	
	
	public OnechatService () {
		chatConnectedUsers = new ArrayList<>();
		
	}	
	
	// 사이즈
	public int size() {
		return chatConnectedUsers.size();
	}
	
	// 추가
	public boolean addSocket(WebSocketSession session) {
		return chatConnectedUsers.add(session);
	}
	//삭제
	public boolean removeSocket(WebSocketSession session) {
		return chatConnectedUsers.remove(session);
	}

	// 작성한것들 보내기
	public void sendMessage(String text) {	
		TextMessage msg = new TextMessage(text);
		for(int i=0; i < chatConnectedUsers.size(); i++) {
			try{				
				chatConnectedUsers.get(i).sendMessage(msg);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}


}