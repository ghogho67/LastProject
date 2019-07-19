package kr.or.ddit.reply.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.reply.dao.IReplyDao;

@Service
public class ReplyService implements IReplyService{
	@Resource(name = "replyDao")
	private IReplyDao replyDao;
	
	
}
