package kr.or.ddit.chat.chatText.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.chat.chatText.dao.IChatTextDao;
import kr.or.ddit.chat.chatText.model.ChatTextVo;
import kr.or.ddit.joinVo.ChatCollectionVo;

@Service
public class ChatTextService implements IChatTextService {

	@Resource(name = "chatTextDao")
	private IChatTextDao chatTextDao;

	@Override
	public int insertChatText(ChatTextVo chatTextVo) {
		return chatTextDao.insertChatText(chatTextVo);
	}

	@Override
	public List<ChatTextVo> getChatTextList(int chat_id) {
		return chatTextDao.getChatTextList(chat_id);
	}

	@Override
	public List<ChatCollectionVo> chatCntList(String mem_id) {
		return chatTextDao.chatCntList(mem_id);
	}

	@Override
	public int chatAllCnt(String mem_id) {
		return chatTextDao.chatAllCnt(mem_id);
	}
}
