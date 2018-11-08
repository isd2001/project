package app.controller.index;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
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
import app.models.accountRepository;
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
	
	
	public List<WebSocketSession> chatSockets;
	
	public List rooms;
	
	public Map<String,List<WebSocketSession>> privateRoomSessions;
	public Map<String,List<String>> privateRoomMembers;
	
	
	
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
		
		Set roomKeys = privateRoomMembers.keySet();
		Iterator itr = roomKeys.iterator();
		while(itr.hasNext()) {
			String key = (String) itr.next();
			if(privateRoomMembers.get(key).contains(session.getAttributes().get("nick"))){
				privateRoomMembers.get(key).remove(session.getAttributes().get("nick"));
				privateRoomSessions.get(key).remove(session);
			}
			System.out.println("session and list removed");
		}
		System.out.println("connection closed");
		chatSockets.remove(session);
	}
	
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		Date current = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		
		String me = message.getPayload();
		
		Map read = gson.fromJson(me, Map.class);
			
		
		for (int i = 0; i < socketService.loggedInUsers.size(); i++) {
			Map info = socketService.loggedInUsers.get(i).getAttributes();
			Map userInfo = (Map) info.get("userInfo");			
				if(info.get("nick").equals(read.get("recipient"))) {
					read.put("recipientProfile", userInfo.get("DOGPROFILE"));
				}
				if(info.get("nick").equals((read.get("sender")))) {					
					read.put("senderProfile", userInfo.get("DOGPROFILE"));	
					}	
		
		}
	
		
		TextMessage whatToSend = new TextMessage(gson.toJson(read));
		
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
					Map toMongo = new HashMap();
					toMongo.put("sender", read.get("sender"));
					toMongo.put("senderProfile", read.get("senderProfile"));
					toMongo.put("recipient", read.get("recipient"));
					toMongo.put("text", read.get("text"));
					toMongo.put("day", sdf.format(current));
					List chatList = new ArrayList();
						chatList.add(read.get("sender"));
						chatList.add(read.get("recipient"));
					toMongo.put("roomlist", chatList);
				
					onechat.addChat(toMongo);	
					System.out.println(toMongo);
				
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
						for(int j=0; j<li.size(); j++) {
							li.get(j).sendMessage(whatToSend);
						}
					}else {						
						for(int j=0; j<li.size(); j++) {
							li.get(j).sendMessage(whatToSend);
						}
					}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			break;
		}
	
	}
}
		
	
	

