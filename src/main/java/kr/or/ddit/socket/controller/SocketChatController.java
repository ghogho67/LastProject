package kr.or.ddit.socket.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.handler.ReplyEchoHandler;
import kr.or.ddit.member.member.model.MemberVo;

@Controller
public class SocketchatController {
	
	private static final Logger logger = LoggerFactory.getLogger(SocketchatController.class);
	
	@Autowired
	private ReplyEchoHandler socketHandler;	// ReplyEchoHandler
	
	// 채팅 화면 요청(파리미터로 userId를 전송) : http://localhost/socketView?userId=brown
	@RequestMapping("/socketview")
	public String socketView(HttpSession session) {		
		MemberVo memVo = (MemberVo) session.getAttribute("MEM_INFO");
		session.setAttribute("mem_id", memVo.getMem_id());
		logger.debug("socketView");
		logger.debug("☞socketView:{}",memVo.getMem_id());
		return "thisTok/thisTokChat";
	}

	// 소켓에 연결된 모든 사용자에게 메세지 전달
	@RequestMapping("/socketServerToClient")
	public void serverToClient() throws IOException {
		socketHandler.severToClient();	
	}
}
