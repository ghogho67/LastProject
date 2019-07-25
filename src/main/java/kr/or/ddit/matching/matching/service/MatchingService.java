package kr.or.ddit.matching.matching.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.matching.matching.dao.IMatchingDao;
import kr.or.ddit.matching.matching.model.MatchingVo;

@Service
public class MatchingService implements IMatchingService{
	
	@Resource(name = "matchingDao")
	private IMatchingDao matchingDao;

	@Override
	public List<MatchingVo> getMatchingList(String mem_id) {
		return matchingDao.getMatchingList(mem_id);
	}

	@Override
	public MatchingVo getMatching(String mat_id) {
		return matchingDao.getMatching(mat_id);
	}

}
