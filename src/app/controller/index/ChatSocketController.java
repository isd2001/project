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
	Set<Map<String,List<String>>> privateRoomMembers;
	
	
	
	List<WebSocketSession> mainSockets; // = mainSocket.loggedInUsers;
	
	public ChatSocketController() {
		chatSockets = new ArrayList<>();
		rooms = new ArrayList<>();
		privateRoomSessions = new HashMap<>();
		privateRoomMembers = new HashSet<>();
					
			
		
		
	};	
		
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {		
		System.out.println("chat Socket established");
		chatSockets.add(session);
		System.out.println("chatSocket : "+session.getAttributes());
		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
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
			if(!privateRoomSessions.containsKey(read.get("roomNumber"))) {
				privateRoomSessions.put((String)read.get("roomNumber"),new ArrayList());
				List list= new ArrayList();
					list.add(read.get("sender"));
					list.add(read.get("recipient"));
				Map map = new HashMap();
					map.put("roomNumber", list);
				privateRoomMembers.add(map);
				
									
			}
			privateRoomSessions.get((String)read.get("roomNumber")).add(session);
			
			for (int i = 0; i < mainSockets.size(); i++) {						
				if (mainSockets.get(i).getAttributes().get("nick").equals(read.get("recipient"))) {				
					WebSocketSession recipient = mainSockets.get(i);
					Map alert = new HashMap();
						alert.put("mode", "newChat");
						alert.put("roomNumber",read.get("roomNumber"));
					TextMessage tm = new TextMessage(gson.toJson(alert));
					recipient.sendMessage(tm);
				}
			}
			break;
		case "chat" :
			List<WebSocketSession> li = privateRoomSessions.get((String)read.get("roomNumber"));
			for(int i=0; i<li.size(); i++) {
				li.get(i).sendMessage(message);
			}
			break;
		}
		
		/*
		// mongodb insert
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date d = new Date();
		//System.out.println("채팅내용>"+onechatservice.list.get(0).getAttributes());
		
		String roomNumber = (String) read.get("roomNumber");	
		System.out.println("sender>>"+read.get("sender")+" / recipient >"+read.get("recipient"));
			
		Map result = new HashMap<>();			
			result.put("sender", read.get("sender"));
			result.put("text", read.get("text"));
			result.put("day", sdf.format(d));
		
		// 채팅창 켜놨나 확인
		WebSocketSession recipient = null;
		WebSocketSession sender = null;
		
		if(privateRoom.get("roomNumber")==null) {
			for (int i = 0; i < mainSockets.size(); i++) {						
				if (mainSockets.get(i).getAttributes().get("nick").equals(read.get("recipient"))) {				
					recipient = mainSockets.get(i);
					result.put("mode", "newChat");
					result.put("roomNumber",roomNumber);
					TextMessage tm = new TextMessage(gson.toJson(result));
					recipient.sendMessage(tm);
				}
			}
		}
		
			
			
		for (int i = 0; i < chatSockets.size(); i++) {
			if(chatSockets.get(i).getAttributes().get("nick").equals(read.get("recipient"))){
								
				//chatService.sendOne(result,chatSockets.get(i).getId());
			}else {
				
			}
					
		}
		
		System.out.println("result >>>"+result);
		onechat.addChat(result);
		//====================================
		String nick=(String)session.getAttributes().get("nick");
		
		System.out.println("nickname >>"+nick);
		//====================================
	
		
		mainSockets = socketService.loggedInUsers;
		
			for (int i = 0; i < mainSockets.size(); i++) {						
				if (mainSockets.get(i).getAttributes().get("nick").equals(read.get("recipient"))) {				
					recipient = mainSockets.get(i);
				}
				if (mainSockets.get(i).getAttributes().get("nick").equals(read.get("sender"))) {
					sender = mainSockets.get(i);
				}		
			}//end for	
			for (int i = 0; i < chatSockets.size(); i++) {
				System.out.println("chatSockets.get Attributes : " + chatSockets.get(i).getAttributes());
				if(chatSockets.get(i).getAttributes().get("nick").equals(read.get("sender"))) {
					System.out.println("sender's chatSocket :"+chatSockets.get(i));
				}
			}
			
		
			System.out.println("recipient : "+recipient);
			System.out.println("sender : "+sender);
			//System.out.println("sender-chat :"+);
			System.out.println("rooms : "+rooms);
			*/
	}
}
			/*
			if(rooms.isEmpty()==false) {
				System.out.println("rooms is not empty");
				for (int i = 0; i < rooms.size(); i++) {
					if(rooms.get(i).users.contains(recipient) && rooms.get(i).users.contains(sender)) {	
						System.out.println("roomUsers"+rooms.get(i).users);
						rooms.get(i).sendMessage(gson.toJson(result));					
						System.out.println("둘다 채팅창 열어놨을때");
					}
				}				
			}
			if(rooms.isEmpty()) {
				System.out.println("rooms is empty");
				Rooms newRoom = new Rooms(recipient,sender);
				System.out.println("newRoom 생성");
					System.out.println(rooms.add(newRoom));
				System.out.println("rooms 에 newRoom 추가");
				System.out.println("방생성 완료");
				
				for (int k = 0; k < sockets.size(); k++) {
					if(sockets.get(k).getId().equals(recipient.getId())==false) {
						System.out.println("recipient 채팅장 안열렸을때 ");
						for (int i = 0; i < loggedInUsers.size(); i++) {
							if(loggedInUsers.get(i).getId().equals(recipient.getId())) {
								System.out.println(loggedInUsers.get(i).getId());
								System.out.println(recipient.getId());
								
								Map map = new HashMap();
									map.put("mode", "newChat");		
									map.put("sender", read.get("sender"));
									map.put("text", read.get("text"));
									map.put("day", sdf.format(d));
								TextMessage tm= new TextMessage(gson.toJson(map));
								loggedInUsers.get(i).sendMessage(tm);
								System.out.println("recipient 한테 메세지 보냄");
							}
						}					
					}else {
						newRoom.sendMessage(gson.toJson(result));
						System.out.println("방에서 메세지 보냄");
					}				
				}
			}			
	}*/
			
		
			
					
					
					/*for (int i = 0; i < rooms.size(); i++) {
						if(rooms.get(i).users.contains(recipient) && rooms.get(i).users.contains(sender)) {	
							System.out.println("roomUsers"+rooms.get(i).users);
							rooms.get(i).sendMessage(gson.toJson(result));					
							System.out.println("둘다 채팅창 열어놨을때");
						}*/
		
			
			/*for (int i = 0; i < rooms.size(); i++) {
				if(rooms.get(i).users.contains(recipient) && rooms.get(i).users.contains(sender)) {				
					rooms.get(i).sendMessage(gson.toJson(result));					
				}else {					
					OnechatService newRoom = new OnechatService(recipient,sender);
					rooms.add(newRoom);					
				}
			}//end for
*/		
			
		//end for
		

		//====================================
		/*for (int i = 0; i < sockets.size(); i++) {
			try {
				sockets.get(i).sendMessage(message);
			} catch (Exception e) {
				e.printStackTrace();				
			}
		}//end for
*/		
		//====================================
		//noticesocket
		
		
		
		
	//end class
	
	

