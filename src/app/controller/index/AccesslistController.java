package app.controller.index;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import app.service.SocketService;

@Controller
public class AccesslistController extends TextWebSocketHandler{
	@Autowired
	SocketService socketService;
	@Autowired
	Gson gson;
		
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		socketService.addSocket(session);
		
		
		
		//=====================================================
		List list = new ArrayList<>();
		for (int i = 0; i < socketService.loggedInUsers.size(); i++) {
			Map info = (Map) socketService.loggedInUsers.get(i).getAttributes().get("userInfo");
			String sessionId = socketService.loggedInUsers.get(i).getId();
			Map map = new HashMap();
				map.put("sessionId", sessionId);
				map.put("nickName", info.get("NICKNAME"));
			list.add(map);
		}
		Map map = new HashMap();
			map.put("mode", "loginUers");
			map.put("list", list);
		
		TextMessage tm= new TextMessage(gson.toJson(map));
		
		for (int i = 0; i < socketService.size(); i++) {
			socketService.loggedInUsers.get(i).sendMessage(tm);
		}
		
	}	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		socketService.removeSocket(session);
	}
	
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {		
		String got = message.getPayload();
		System.out.println("accessController handleTXT method");
		Map jmap = gson.fromJson(got,Map.class);
		
		System.out.println("jmap = "+jmap);
	
	}
}
