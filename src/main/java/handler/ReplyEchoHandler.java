package handler;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ReplyEchoHandler extends TextWebSocketHandler {
	private static final Logger logger = LoggerFactory.getLogger(ReplyEchoHandler.class);
	/**
	 *연결성공시
	 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
	
	}

	/**
	 *메세지 보냈을때
	 */
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

	}

	/**
	 *접속 연결 해제시
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

	}

}
