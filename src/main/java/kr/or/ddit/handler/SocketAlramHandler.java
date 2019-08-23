package kr.or.ddit.handler;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.or.ddit.chat.chatMem.model.ChatMemVo;
import kr.or.ddit.chat.chatMem.service.IChatMemService;
import kr.or.ddit.chat.chatText.service.IChatTextService;

public class SocketAlramHandler extends TextWebSocketHandler {
	private static final Logger logger = LoggerFactory.getLogger(SocketAlramHandler.class);

	@Resource(name = "chatTextService")
	private IChatTextService chaTextService;
	
	@Resource(name = "chatMemService")
	private IChatMemService chatmemService;
	
	@Resource(name="chatAlramWebSocketSessionList")
	private List<WebSocketSession> sessionList;	// 소켓에 연결된 세션정보
	
	public SocketAlramHandler() {
		//sessionList = new ArrayList<>();
		
		logger.debug("☞sessionList:{}",sessionList);
	}
	
	// 클라이언트가 웹소켓에 접속하여 연결이 맺어진 후에 호출
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		String user = getUser(session);
		
		sessionList.add(session);
		
		
		logger.debug("☞아아알람 메인 접속!!알람 접속 : {}", user);
		logger.debug("☞알람 접속session : {}", session);
	}
	
	
// 클라이언트가 웹소켓에 메세지를 전송한 경우 : 모든 사용자에게 메세지를 전달
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) 
	throws Exception {
		
		String user = getUser(session);
		List<ChatMemVo> chatMemList = chatmemService.selectChatmemVoList(user);
		Map<String, Object> map = new HashMap<String, Object>();
		
		for (WebSocketSession currentSession : sessionList) {
			
				map = currentSession.getAttributes();
				String mapMem_id = (String) map.get("mem_id");
				if(mapMem_id.equals(user)) {
				int count=0;
					
					for(ChatMemVo chat : chatMemList) {
						if(chat.getNewmsgyn().equals("Y")) {
							count=count+1;
						}
					}
					if(count>0)
						currentSession.sendMessage(new TextMessage("NEW"));
				}
			}
		
		
		
		
			
//			Map<String, Object> map = new HashMap<String, Object>();
//			for (WebSocketSession currentSession : sessionList) {
//				logger.debug("☞currentSession:{}",currentSession);
//				
//				 map = currentSession.getAttributes();
//				 logger.debug("☞currentSession.getAttributes();:{}",currentSession.getAttributes());
//				 logger.debug("☞map:{}",map);
//				int mapChat_id = (int) map.get("chat_id");
//				if(mapChat_id == chat_id) {
//					currentSession.sendMessage(new TextMessage(user + " : " + message.getPayload()));
//				}
		}
		
	
	// 클라이언트 연결이 종료된경우 : 연결 리스트에서 해당 사용자 제거
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status)
	throws Exception {
		
			String user = getUser(session);
			sessionList.remove(session);
			logger.debug("☞연결 끊김:{}",user);
			logger.debug("연결 끊김 : {}", user);
			
			logger.debug("☞: afterConnection sessionList{}", sessionList);
		}
	
	
	
	//webSocketSession으로부터 userId 정보 조회
	private String getUser(WebSocketSession session) {
		logger.debug("☞session.getAttributes().get(mem_id) :{}",session.getAttributes().get("mem_id"));
		return (String) session.getAttributes().get("mem_id");
		
	}
	
	//webSocketSession으로부터 userId 정보 조회
		private int getCaht_id(WebSocketSession session) {
			logger.debug("☞session.getAttributes().get(mem_id) :{}",session.getAttributes().get("chat_id"));
			return (int) session.getAttributes().get("chat_id");
			
		}
	
	// 서버측에서 모든 websocket session으로 보내는 메세지
		public void serverToClient() throws IOException {
			for(WebSocketSession wSession : sessionList)
				
				wSession.sendMessage(new TextMessage("서버 전송 메세지"));	
		}
	




}
