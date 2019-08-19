package kr.or.ddit.chat.chat.service;

import java.util.List;

import kr.or.ddit.chat.chat.model.ChatVo;
import kr.or.ddit.joinVo.ChatMemListVo;

public interface IChatService {
	List<ChatMemListVo> chatList(String mem_id);
	
	int deletChat(int chat_id);
	
	int insertChat(ChatVo chatVo);

}
