package kr.or.ddit.noticeReply.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.noticeReply.dao.INoticeReplyDao;

@Service
public class NoticeReplyService implements INoticeReplyService{
	@Resource(name = "noticeReplyDao")
	private INoticeReplyDao noticeReplyDao;
}
