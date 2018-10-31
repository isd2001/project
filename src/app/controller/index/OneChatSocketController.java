package app.controller.index;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

import app.models.OnechatRepository;

@Controller
public class OneChatSocketController extends TextWebSocketHandler{
	@Autowired
	Gson gson;
	@Autowired
	OnechatRepository onechat;
	
	List<WebSocketSession> sockets;
	
	public OneChatSocketController() {
		sockets = new ArrayList<>();
	};
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String me = message.getPayload();
		System.out.println("me >"+me);
		
		Map read = gson.fromJson(me, Map.class);
		//====================================
		// mongodb insert
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date d = new Date();
		
		Map result = new HashMap<>();
			result.put("sender", read.get("sender"));
			result.put("recipient", read.get("recipient"));
			result.put("text", read.get("text"));
			result.put("day", sdf.format(d));
		onechat.addChat(result);
		
		//====================================
		
		
		
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sockets.add(session);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sockets.remove(session);
	}
	
	
}
