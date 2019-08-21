package kr.or.ddit.chat.chatText.service;

import java.util.List;

import kr.or.ddit.chat.chatText.model.ChatTextVo;
import kr.or.ddit.joinVo.ChatCollectionVo;

public interface IChatTextService {
	
	int insertChatText(ChatTextVo chatTextVo);

	List<ChatTextVo> getChatTextList(int chat_id);
	
	List<ChatCollectionVo> chatCntList(String mem_id);
	
	int chatAllCnt(String mem_id);
}
