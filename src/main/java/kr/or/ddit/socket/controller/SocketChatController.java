package kr.or.ddit.socket.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.chat.chatText.model.ChatTextVo;
import kr.or.ddit.chat.chatText.service.IChatTextService;
import kr.or.ddit.handler.SocketChatHandler;

@Controller
public class SocketChatController {
	@Resource(name = "chatTextService")
	private IChatTextService chatTextService;
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(SocketChatController.class);
	@Autowired
	private SocketChatHandler socketHandler; // SocketChantHandelr

	// 채팅 화면 요청(파리미터로 userId를 전송) : http://localhost/socketView?userId=brown
	@RequestMapping(path = "/socket/view")
	public String socketView(HttpSession session, String mem_id, Model model, int chat_id) {
		logger.debug("mem_id :{}", mem_id);
		logger.debug("chat_id :{}", chat_id);
		
		session.setAttribute("mem_id", mem_id);
		session.setAttribute("chat_id", chat_id);
		
		List<ChatTextVo> chatTextList = chatTextService.getChatTextList(chat_id);
		
		
		model.addAttribute("chatTextList",chatTextList);
		model.addAttribute("mem_id",mem_id);
		logger.debug("☞mem_id:{}",mem_id);
		logger.debug("☞chat_id:{}",chat_id);
		
		return "thistok/chatView";
	}

	// 소켓에 연결된 모든 사용자에게 메세지 전달
	@RequestMapping("/socket/serverToClient")
	public void serverToClient() throws IOException {
		socketHandler.serverToClient();
	}
}

