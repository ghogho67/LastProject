package kr.or.ddit.chatbot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatbotController {

	@RequestMapping(path = "/chatbot")
	public String chatbot() {
	
		
		return "/chatbot/chatbot";
	}
	
	
	@RequestMapping("/speechToText")
	public String speechToText() {
		
		
		
		return "/chatbot/speechToText";
	}
	
}
