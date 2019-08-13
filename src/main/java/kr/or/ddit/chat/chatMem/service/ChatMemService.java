package kr.or.ddit.chat.chatMem.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.chat.chatMem.dao.IChatMemDao;
import kr.or.ddit.chat.chatMem.model.ChatMemVo;

@Service
public class ChatMemService implements IChatMemService {
	
	@Resource(name = "chatMemDao")
	private IChatMemDao chatMemDao;
	
	
	@Override
	public int insertChatMem(ChatMemVo chatMemVo) {
		return chatMemDao.insertChatMem(chatMemVo);
	}


	
	
}
