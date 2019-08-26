package kr.or.ddit.chatbot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ChatbotController {

	@RequestMapping(path = "/chatbot", method = RequestMethod.GET)
	public String chatbot(Model model, String str, String userquestion, String userSay, String chatBotSay) {
	
		
		
		return "chatbot/chatbot";
	}
	

	
}
