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
import app.service.SocketService;

@Controller
public class OneChatSocketController extends TextWebSocketHandler{
	@Autowired
	Gson gson;
	@Autowired
	OnechatRepository onechat;
	@Autowired
	SocketService socketservice;
	
	
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
		
		
		List roomlist = new ArrayList<>();
			roomlist.add(read.get("sender"));
			roomlist.add(read.get("recipient"));
			
		Map result = new HashMap<>();
			result.put("roomlist", roomlist);
			result.put("sender", read.get("sender"));
			result.put("text", read.get("text"));
			result.put("day", sdf.format(d));
			
		System.out.println("result >>>"+result);
		onechat.addChat(result);
		//====================================
		String nick=(String)session.getAttributes().get("nick");
		
		System.out.println("nickname >>"+nick);
		//====================================
		
		
		
		
		
		//====================================
		
		
		
		for (int i = 0; i < socketservice.size(); i++) {
			if (socketservice.list.get(i).getAttributes().get("nick").equals(read.get("recipient"))) {
				sockets.get(i).sendMessage(message);
			}
		}//end for
		
		
		
		
		//====================================
		for (int i = 0; i < sockets.size(); i++) {
			try {
				sockets.get(i).sendMessage(message);
			} catch (Exception e) {
				e.printStackTrace();				
			}
		}//end for
		//====================================
		//noticesocket
		
		
		
		
	}//end class
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sockets.add(session);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sockets.remove(session);
	}
	
	
}
