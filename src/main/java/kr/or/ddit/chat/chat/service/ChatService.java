package kr.or.ddit.chat.chat.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.chat.chat.dao.IChatDao;
import kr.or.ddit.joinVo.ChatMemListVo;


@Service
public class ChatService implements IChatService {
	@Resource(name = "chatDao")
	private IChatDao chatDao;

	@Override
	public List<ChatMemListVo> chatList(String mem_id) {
		return chatDao.chatList(mem_id);
	}
	
	

}
