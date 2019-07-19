package kr.or.ddit.notice.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.notice.dao.INoticeDao;

@Service
public class NoticeService implements INoticeService {
	@Resource(name = "noticeDao")
	private INoticeDao noticeDao;

}
