package kr.or.ddit.chat.chat.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.member.member.model.MemberVo;

@RequestMapping("/chat")
@Controller
public class ChatController {
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	@RequestMapping(path = "/thistok", method = RequestMethod.GET)
	public String thistock(String mem_id, Model model, HttpSession session) {
		//mem id로 채팅회원 방아이디 검색을 한다. 그리고 그에대한 LIST를 뿌려준다.
		logger.debug("☞thistockmemid:{}",mem_id);
		session.setAttribute("mem_id", mem_id);	
		model.addAttribute("mem_id",mem_id);
	
		return "thistok/thistok";
	}
}
