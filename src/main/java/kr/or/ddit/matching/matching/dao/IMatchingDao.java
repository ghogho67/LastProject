package kr.or.ddit.matching.matching.dao;

import kr.or.ddit.matching.matching.model.MatchingVo;

public interface IMatchingDao {
//
//	List<MatchingVo> getMatchingList(String mem_id);
//
//	int insertCalendar(MatchingVo vo);
//
//	List<MatchingVo> getCalendar();
//
//	int updateCalendar(MatchingVo vo);
//
	int matchingDelete(int mat_id);

	MatchingVo getMatchingVo(int mat_id);

	int matchingCreate(MatchingVo vo);

}
