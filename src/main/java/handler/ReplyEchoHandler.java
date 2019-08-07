package handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.or.ddit.member.member.model.MemberVo;

public class ReplyEchoHandler extends TextWebSocketHandler {
	private static final Logger logger = LoggerFactory.getLogger(ReplyEchoHandler.class);
	private List<WebSocketSession> sessionList; // 소켓에 연결된 세션정보
	public ReplyEchoHandler() {
		sessionList = new ArrayList<>();
	}
	
	
	/**
	 *연결성공시
	 *즉 클라이언트가 웹소켓에 접속하여 연결이 맺어진 후 호출
	 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String mem_id = getUserVo(session);
		sessionList.add(session);
		logger.debug("☞채팅접속 :{}",mem_id);
	}

	/**
	 *메세지 보냈을때
	 */
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String mem_id = getUserVo(session);
		logger.debug("☞메세지전송={} :{}",mem_id, message.getPayload());
		for(WebSocketSession currentSession : sessionList)
			currentSession.sendMessage(new TextMessage(mem_id + ":"+message.getPayload()));
		
	}

	/**
	 *접속 연결 해제시
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String mem_id = getUserVo(session);
		sessionList.remove(session);
		logger.debug("☞연결끊김:{}",mem_id);
	}
	
	private String getUserVo(WebSocketSession session) {
		return  (String)session.getAttributes().get("mem_id");
	}
	
	public void severToClient() throws IOException{
		for(WebSocketSession wSession : sessionList)
			wSession.sendMessage(new TextMessage("서버 전송 메세지"));
			
	}

}
