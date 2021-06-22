package com.brEnt.brFamily.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {
	
	// 채팅 메인 (주소록)
	@RequestMapping("chatMain.ch")
	public String chatMain() {
		return "chat/chatMain"; 
	}
	
	// 채팅 목록 
	@RequestMapping("chatList.ch")
	public String chatList() {
		return "chat/chatList"; 
	}
	
	// 채팅방 
	@RequestMapping("chatRoom.ch")
	public String chatRoom() {
		return "chat/chatRoom"; 
	}
	
}
