package kr.or.ddit.chat.chatMem.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import kr.or.ddit.chat.chatMem.dao.IChatMemDao;
import kr.or.ddit.chat.chatMem.model.ChatMemVo;

@Service
public class ChatMemService implements IChatMemService {
	private static final Logger logger = LoggerFactory.getLogger(ChatMemService.class);
	
	@Resource(name = "chatMemDao")
	private IChatMemDao chatMemDao;
	
	@Resource(name="chatAlramWebSocketSessionList")
	private List<WebSocketSession> alramSessionList;	// 채팅방에 참여하지 않고 main.jsp에서 대기중인 세션 리스트
	
	
	@Override
	public int insertChatMem(ChatMemVo chatMemVo) {
		return chatMemDao.insertChatMem(chatMemVo);
	}


	@Override
	public int messageUpdate(Map<String, Object> map) {
		int updateCnt = chatMemDao.messageUpdate(map);
		
		logger.debug("☞: list size : {}", alramSessionList.size());
		for(WebSocketSession currentSession : alramSessionList) {
			logger.debug("☞chatmemService:{}", currentSession);
			Map<String, Object> m = currentSession.getAttributes();
			
			logger.debug("☞ m.mem_id : {}", m.get("mem_id"));
			
			if(map.get("mem_id").equals(m.get("mem_id"))){
				try {
					if(map.get("newmsgyn").equals("Y")) {
						logger.debug("☞ newmsg :");
						currentSession.sendMessage(new TextMessage("NEW"));
					}
					else {
						logger.debug("☞ oldmsg :");
						currentSession.sendMessage(new TextMessage("OLD"));
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}					
		}
		
		return updateCnt;
	}


	@Override
	public String selectChatmemid(Map<String, Object> map) {
		return chatMemDao.selectChatmemid(map);
	}


	@Override
	public List<ChatMemVo> selectChatmemVoList(String mem_id) {
		return chatMemDao.selectChatmemVoList(mem_id);
	}


	
	
}
