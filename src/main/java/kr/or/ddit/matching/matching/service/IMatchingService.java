package kr.or.ddit.matching.matching.service;

import java.util.List;

import kr.or.ddit.matching.matching.model.MatchingVo;

public interface IMatchingService {

	
	List<MatchingVo> getMatchingList(String mem_id);
	
	MatchingVo getMatching(String mat_id);
	
}
