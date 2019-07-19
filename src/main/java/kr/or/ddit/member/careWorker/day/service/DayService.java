package kr.or.ddit.member.careWorker.day.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.member.careWorker.day.dao.IDayDao;

@Service
public class DayService implements IDayService {
	
	@Resource(name = "dayDao")
	private IDayDao dayDao;

}
