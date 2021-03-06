package kr.or.ddit.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.or.ddit.chat.chatMem.service.IChatMemService;
import kr.or.ddit.chat.chatText.model.ChatTextVo;
import kr.or.ddit.chat.chatText.service.IChatTextService;

public class SocketChatHandler extends TextWebSocketHandler {
	private static final Logger logger = LoggerFactory.getLogger(SocketChatHandler.class);

	@Resource(name = "chatTextService")
	private IChatTextService chaTextService;
	
	@Resource(name = "chatMemService")
	private IChatMemService chatMemService;
	
	
	private List<WebSocketSession> sessionList;	// 소켓에 연결된 세션정보
	
	@Resource(name="chatAlramWebSocketSessionList")
	private List<WebSocketSession> alramSessionList;	// 채팅방에 참여하지 않고 main.jsp에서 대기중인 세션 리스트
	
	public SocketChatHandler() {
		sessionList = new ArrayList<>();
		logger.debug("☞sessionList:{}",sessionList);
	}
	
	// 클라이언트가 웹소켓에 접속하여 연결이 맺어진 후에 호출
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		sessionList.add(session);
		List<String> id = new ArrayList<String>();
		//사용자 리스트 문자열만드는 반복문
//		for (WebSocketSession currentSession : sessionList) {
//				id.add(getUser(currentSession));
			
//		}
		
		//채팅방 접속한 사용자에게 위에서 만든 문자열 전송
		
//		for (WebSocketSession currentSession : sessionList) {

//		}
		
		
//		logger.debug("☞채팅 접속 : {}", user);
		logger.debug("☞채팅 접속session : {}", session);
	}
	
	
// 클라이언트가 웹소켓에 메세지를 전송한 경우 : 모든 사용자에게 메세지를 전달
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) 
	throws Exception {
		
			String user = getUser(session);
			String mem_id = user;
			String chattext_cont = message.getPayload();
			int chat_id = getCaht_id(session);
			
			ChatTextVo chatTextVo = new ChatTextVo(chat_id, mem_id, chattext_cont);
			chaTextService.insertChatText(chatTextVo);
			
			Map<String, Object> map = new HashMap<String, Object>();
			for (WebSocketSession currentSession : sessionList) {
				logger.debug("☞currentSession:{}",currentSession);
				
				 map = currentSession.getAttributes();
				 logger.debug("☞currentSession.getAttributes();:{}",currentSession.getAttributes());
				 logger.debug("☞map:{}",map);
				int mapChat_id = (int) map.get("chat_id");
				if(mapChat_id == chat_id) {
					logger.debug("☞ chat message : ");
					currentSession.sendMessage(new TextMessage("msg" + ":" +user + ":" + message.getPayload()));
				}
			logger.debug("☞sessionList:{}",sessionList);
			}
			
			//해당 채팅방에 참여한 사람들 목록 조회(현재는 2명)
			Map<String, Object> select = new HashMap<String, Object>();
			select.put("mem_id",user);
			select.put("chat_id",chat_id);
			
			String differenceMem_id = chatMemService.selectChatmemid(select); // 나아닌 다른 사람의 아이디를 갖고온다.
			
			
			//다른사람이 채팅방에 있는지 없는지 확인
			boolean notExistsInChatRoom = true;
			for(WebSocketSession currentSession : sessionList) {
				if(getUser(currentSession).equals(differenceMem_id)) {
					notExistsInChatRoom = false;
				}
			}
			
			
			
				//채팅방에 접속하지 않은 사람에게 미열람 메세지가 있다고 표시
				logger.debug("☞: alramSessionList.size {}", alramSessionList.size());
				//for(WebSocketSession currentSession : alramSessionList) {
					//chatMem 테이블에 안읽은 메세지 여부 업데이트
					Map<String, Object> mu = new HashMap<String, Object>();
					mu.put("mem_id", differenceMem_id);
					mu.put("chat_id",chat_id);
					if(notExistsInChatRoom)
						mu.put("newmsgyn","Y");
					else
						mu.put("newmsgyn","N");
					
					int update = chatMemService.messageUpdate(mu);// 메세지 여부 업데이트 쿼리
					
					
	//				int mapChat_id = (int) map.get("chat_id");
	//				
	//				Map<String, Object> m = currentSession.getAttributes();
	//				logger.debug("☞alramSession : {}", m );
	//				if(mapChat_id == chat_id){
	//					currentSession.sendMessage(new TextMessage("NEW"));
	//				}
				
			//}
				
				
			
			
			// - chatMem 테이블에 안읽은 메세지 여부 업데이트
			

			
			
			
		}
		
	
	// 클라이언트 연결이 종료된경우 : 연결 리스트에서 해당 사용자 제거
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status)
	throws Exception {
		
			String user = getUser(session);
			sessionList.remove(session);
			logger.debug("☞연결 끊김:{}",user);
			logger.debug("연결 끊김 : {}", user);
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
