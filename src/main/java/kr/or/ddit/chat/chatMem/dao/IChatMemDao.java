package kr.or.ddit.chat.chatMem.dao;

import java.util.Map;

import kr.or.ddit.chat.chatMem.model.ChatMemVo;

public interface IChatMemDao {
	
	int insertChatMem(ChatMemVo chatMemVo);
	
	int messageUpdate(Map<String, Object> map);
	
	String selectChatmemid(Map<String, Object> map);

}
