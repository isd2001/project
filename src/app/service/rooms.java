package app.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.google.gson.Gson;

import app.controller.index.OneChatSocketController;


public class rooms {	
	   
	public List<WebSocketSession> users;		
	
	
	public rooms(WebSocketSession user1,WebSocketSession user2) {
		users = new ArrayList<>();			
			this.users.add(user1);
			this.users.add(user2);
	}	
	
	public void sendMessage(String text) {	
		TextMessage msg = new TextMessage(text);
		for(int i=0; i < users.size(); i++) {
			try{				
				users.get(i).sendMessage(msg);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}


}