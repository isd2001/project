package app.controller.index;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
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
		
		for (int i = 0; i < socketService.size(); i++) {
			Map m=(Map)socketService.list.get(i).getAttributes().get("userInfo");
			System.out.println("m>>"+m);
			list.add(m.get("NICKNAME"));			
		}
		TextMessage tm= new TextMessage(gson.toJson(list));
		
		for (int i = 0; i < socketService.size(); i++) {
			socketService.list.get(i).sendMessage(tm);
		}
		
		System.out.println("list :"+list);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		socketService.removeSocket(session);
	}
	
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {

		
	}
}
