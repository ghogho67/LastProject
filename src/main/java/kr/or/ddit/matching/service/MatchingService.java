package kr.or.ddit.matching.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.matching.dao.IMatchingDao;

@Service
public class MatchingService implements IMatchingService{
	
	@Resource(name = "matchingDao")
	private IMatchingDao matchingDao;

}
