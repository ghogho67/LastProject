package kr.or.ddit.chat.chatMem.service;

import java.util.Map;

import kr.or.ddit.chat.chatMem.model.ChatMemVo;

public interface IChatMemService {
	
	int insertChatMem(ChatMemVo chatMemVo);
	
	int messageUpdate(Map<String, Object> map);
	
	String selectChatmemid(Map<String, Object> map);
}
