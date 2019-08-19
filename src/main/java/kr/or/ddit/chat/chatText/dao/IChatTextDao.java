package kr.or.ddit.chat.chatText.dao;

import java.util.List;

import kr.or.ddit.chat.chatText.model.ChatTextVo;
import kr.or.ddit.joinVo.ChatCollectionVo;

public interface IChatTextDao {
	
	int insertChatText(ChatTextVo chatTextVo);
	
	List<ChatTextVo> getChatTextList(int chat_id);
	
	List<ChatCollectionVo> chatCntList(String mem_id);

}
