package kr.or.ddit.chat.chatText.service;

import java.util.List;

import kr.or.ddit.chat.chatText.model.ChatTextVo;

public interface IChatTextService {
	
	int insertChatText(ChatTextVo chatTextVo);

	List<ChatTextVo> getChatTextList(int chat_id);
}
