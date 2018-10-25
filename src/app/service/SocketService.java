package app.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.google.gson.Gson;

@Service
public class SocketService {
//
//	List<WebSocketSession> sockets;
//	
//	@Autowired
//	Gson gson;
//	
//	public SocketService() {
//		sockets = new ArrayList<>();
//	}
//
//	public boolean addSocket(WebSocketSession session) {
//		return sockets.add(session);
//	}
//	
//	public boolean removeSocket(WebSocketSession session) {
//		return seockets.remove(session);
//	}
//
//	// 작성한것들 보내기
//	public void sendWrite(String text) {
//		TextMessage msg = new TextMessage(text);
//		for(int i=0; i < sockets.size(); i++) {
//			try{
//				sockets.get(i).sendMessage(msg);
//			}catch(Exception e) {
//				e.printStackTrace();
//			}
//		}
//	}
//	
	
}
