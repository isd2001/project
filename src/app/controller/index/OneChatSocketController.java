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
import app.service.OnechatService;
import app.service.SocketService;
import app.service.rooms;

@Controller
public class OneChatSocketController extends TextWebSocketHandler{
	@Autowired
	Gson gson;
	@Autowired
	OnechatRepository onechat;
	
	@Autowired
	SocketService mainSocket;
	
	@Autowired
	OnechatService chatSocket;
	
	
	List<WebSocketSession> sockets;
	
	List rooms;
	
	List<WebSocketSession> loggedInUsers; // = mainSocket.loggedInUsers;
	
	public OneChatSocketController() {
		sockets = new ArrayList<>();
		rooms = new ArrayList<>();
		
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
		//System.out.println("채팅내용>"+onechatservice.list.get(0).getAttributes());
		
		List roomlist = new ArrayList<>();
			roomlist.add(read.get("sender"));
			roomlist.add(read.get("recipient"));
		System.out.println("sender>>"+read.get("sender")+" / recipient >"+read.get("recipient"));
			
		Map result = new HashMap<>();
			result.put("mode", "newChat");
			result.put("sender", read.get("sender"));
			result.put("text", read.get("text"));
			result.put("day", sdf.format(d));
			
		System.out.println("result >>>"+result);
		onechat.addChat(result);
		//====================================
		String nick=(String)session.getAttributes().get("nick");
		
		System.out.println("nickname >>"+nick);
		//====================================
		WebSocketSession recipient = null;
		WebSocketSession sender = null;
		
		loggedInUsers = mainSocket.loggedInUsers;
		
			for (int i = 0; i < loggedInUsers.size(); i++) {						
				if (loggedInUsers.get(i).getAttributes().get("nick").equals(read.get("recipient"))) {				
					recipient = loggedInUsers.get(i);
				}
				if (loggedInUsers.get(i).getAttributes().get("nick").equals(read.get("sender"))) {
					sender = loggedInUsers.get(i);
				}		
			}//end for		
			System.out.println("recipient : "+recipient);
			System.out.println("sender : "+sender);
			System.out.println("rooms : "+rooms);
			
			
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
				rooms newRoom = new rooms(recipient,sender);
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
	}
			
		
			
					
					
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
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sockets.add(session);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sockets.remove(session);
	}
	
	
}
