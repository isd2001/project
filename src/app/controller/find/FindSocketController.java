package app.controller.find;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import app.service.SocketService;

public class FindSocketController extends TextWebSocketHandler{

	@Autowired
	Gson gson;
	
	@Autowired
	SocketService service;
	
	List<WebSocketSession> sockets;
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sockets.remove(session);
	}
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sockets.add(session);
	}
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String got = message.getPayload();
		Map jmap = gson.fromJson(got,Map.class);
		
		
	}
}
