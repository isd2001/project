package app.controller.index;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import app.models.OnechatRepository;
import app.service.SocketService;
import app.service.chatService;

@Controller
public class ChatSocketController extends TextWebSocketHandler{
	@Autowired
	Gson gson;
	@Autowired
	OnechatRepository onechat;
	
	@Autowired
	SocketService socketService;
	
	@Autowired
	chatService chatService;
	
	
	List<WebSocketSession> chatSockets;
	
	List rooms;
	
	Map<String,List<WebSocketSession>> privateRoomSessions;
	Map<String,List<String>> privateRoomMembers;
	
	
	
	List<WebSocketSession> mainSockets; // = mainSocket.loggedInUsers;
	
	public ChatSocketController() {
		chatSockets = new ArrayList<>();
		rooms = new ArrayList<>();
		privateRoomSessions = new HashMap<>();
		privateRoomMembers = new HashMap<>();
					
			
		
		
	};	
		
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {		
		System.out.println("chat Socket established");
		chatSockets.add(session);
		System.out.println("chatSocket : "+session.getAttributes());
		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("connection closed");
		chatSockets.remove(session);
	}
	
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String me = message.getPayload();
		System.out.println("me >"+me);		
		
		
		Map read = gson.fromJson(me, Map.class);
		//====================================
		String mode = (String)read.get("mode");
		switch(mode) {
		case "register" : 
			try {
				if(!privateRoomSessions.containsKey(read.get("roomNumber"))) {
					privateRoomSessions.put((String)read.get("roomNumber"),new ArrayList());
					List list= new ArrayList();
						list.add(read.get("sender"));
						list.add(read.get("recipient"));
					Map map = new HashMap();
						map.put("roomNumber", list);
					privateRoomMembers.put((String) read.get("roomNumber"), list);
					
										
				}
				privateRoomSessions.get((String)read.get("roomNumber")).add(session);
				
				for (int i = 0; i < socketService.loggedInUsers.size(); i++) {						
					if (socketService.loggedInUsers.get(i).getAttributes().get("nick").equals(read.get("recipient"))) {				
						WebSocketSession recipient = socketService.loggedInUsers.get(i);
						Map alert = new HashMap();
							alert.put("mode", "newChat");
							alert.put("roomNumber",read.get("roomNumber"));
							alert.put("sender", read.get("sender"));
						TextMessage tm = new TextMessage(gson.toJson(alert));
						recipient.sendMessage(tm);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			break;
		case "chat" :	
			try {
				List<WebSocketSession> li = privateRoomSessions.get((String)read.get("roomNumber"));
				System.out.println(li.size());
				for(int i=0; i<li.size(); i++) {
					if(li.size()<2) {
						for (int k = 0; k < socketService.loggedInUsers.size(); k++) {						
							if (socketService.loggedInUsers.get(k).getAttributes().get("nick").equals(read.get("recipient"))) {				
								WebSocketSession recipient = socketService.loggedInUsers.get(k);
								Map alert = new HashMap();
									alert.put("mode", "newChat");
									alert.put("roomNumber",read.get("roomNumber"));
									alert.put("sender", read.get("sender"));
								TextMessage tm = new TextMessage(gson.toJson(alert));
								recipient.sendMessage(tm);
							}
						}
					}else {						
						for(int j=0; j<li.size(); j++) {
							li.get(j).sendMessage(message);
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			break;
		}
	
	}
}
		
	
	

