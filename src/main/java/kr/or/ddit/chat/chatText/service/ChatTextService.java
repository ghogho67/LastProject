package kr.or.ddit.chat.chatText.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.chat.chatText.dao.IChatTextDao;
import kr.or.ddit.chat.chatText.model.ChatTextVo;

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
}
