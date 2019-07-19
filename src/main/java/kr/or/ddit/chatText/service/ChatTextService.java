package kr.or.ddit.chatText.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.chatText.dao.IChatTextDao;

@Service
public class ChatTextService implements IChatTextService {

	@Resource(name = "chatTextDao")
	private IChatTextDao chatTextDao;
}
