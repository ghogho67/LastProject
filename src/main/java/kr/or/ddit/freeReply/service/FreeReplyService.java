package kr.or.ddit.freeReply.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.freeReply.dao.IFreeReplyDao;

@Service
public class FreeReplyService implements IFreeReplyService{

	@Resource(name = "freeReplyDao")
	private IFreeReplyDao freeReplyDao;
}
