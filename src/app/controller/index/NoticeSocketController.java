package app.controller.index;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import app.service.SocketService;

@Controller
public class NoticeSocketController extends TextWebSocketHandler{
	/*@Autowired
	SocketService socketservice;
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		
	}
	
	*/
}
