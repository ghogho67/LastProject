package kr.or.ddit.matching.matching.dao;

import java.util.List;

import kr.or.ddit.matching.matching.model.MatchingVo;

public interface IMatchingDao {

	
	
	
	
	
	List<MatchingVo> getMatchingList(String mem_id);
	
	MatchingVo getMatching(String mat_id);
	
	
}
