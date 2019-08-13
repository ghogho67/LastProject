package kr.or.ddit.chat.chatText.dao;

import java.util.List;

import kr.or.ddit.chat.chatText.model.ChatTextVo;

public interface IChatTextDao {
	
	int insertChatText(ChatTextVo chatTextVo);
	
	List<ChatTextVo> getChatTextList(int chat_id);

}
