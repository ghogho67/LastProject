package kr.or.ddit.cwDay.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.cwDay.dao.ICwDayDao;

@Service
public class CwDayService implements ICwDayService {
	
	@Resource(name = "cwDayDao")
	private ICwDayDao cwDayDao;
	
}
