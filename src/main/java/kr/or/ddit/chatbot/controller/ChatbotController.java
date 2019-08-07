package kr.or.ddit.chatbot.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.member.member.model.MemberVo;

@Controller
public class ChatbotController {

	@RequestMapping(path = "/chatbot")
	public String chatbot(HttpSession session, Model model, String mem_id) {
	
//		MemberVo memberVo = (MemberVo) session.getAttribute(mem_id);
//		
//		session.setAttribute("mem_id", memberVo.getMem_id());
		
		return "/chatbot/chatbot";
	}
	
}
