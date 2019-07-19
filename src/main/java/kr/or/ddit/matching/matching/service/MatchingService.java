package kr.or.ddit.matching.matching.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.matching.matching.dao.IMatchingDao;

@Service
public class MatchingService implements IMatchingService{
	
	@Resource(name = "matchingDao")
	private IMatchingDao matchingDao;

}
