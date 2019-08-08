package kr.or.ddit.socket.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.handler.SocketChatHandler;

@Controller
public class SocketChatController {
	private static final Logger logger = LoggerFactory.getLogger(SocketChatController.class);
	@Autowired
	private SocketChatHandler socketHandler;	
	
	// 채팅 화면 요청(파리미터로 userId를 전송)
	@RequestMapping("/socket/view")
	public String socketView(HttpSession session, String mem_id, Model model) {		
		
//		MemberVo memVo = (MemberVo) session.getAttribute("MEM_INFO");
//		session.setAttribute("mem_id", memVo.getMem_id());
		logger.debug("☞socketView mem_id:{}",mem_id);
		session.setAttribute("mem_id", mem_id);
		return "thistok/chatView";
	}

	// 소켓에 연결된 모든 사용자에게 메세지 전달
	@RequestMapping("/socketServerToClient")
	public void serverToClient() throws IOException {
		socketHandler.serverToClient();	
	}
}
