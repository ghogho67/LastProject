package kr.or.ddit.chat.chatMem.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.chat.chatMem.dao.IChatMemDao;

@Service
public class ChatMemService implements IChatMemService {

	@Resource(name = "chatMemDao")
	private IChatMemDao chatMemDao;
}
