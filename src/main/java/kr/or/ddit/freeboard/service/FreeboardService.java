package kr.or.ddit.freeboard.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.freeboard.dao.IFreeboardDao;

@Service
public class FreeboardService implements IFreeboardService {
	
	@Resource(name = "freeboardDao")
	private IFreeboardDao freeboardDao;
}
