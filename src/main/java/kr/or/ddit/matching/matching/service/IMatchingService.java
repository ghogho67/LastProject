package kr.or.ddit.matching.matching.service;

import java.util.List;

import kr.or.ddit.matching.matching.model.MatchingVo;

public interface IMatchingService {
//
//	List<MatchingVo> getMatchingList(String mem_id);
//
//	MatchingVo getMatching(String mat_id);
//
//	int insertCalendar(MatchingVo vo);
//
//	List<MatchingVo> getCalendar();
//
//	int updateCalendar(MatchingVo vo);
//
//	int deleteCalendar(int c_id);

	int matchingDelete(int mat_id);

	MatchingVo getMatchingVo(int mat_id);

	int matchingCreate(MatchingVo vo);

	int matchingModify(MatchingVo mvo);

	List<MatchingVo> getMatchingList(String cw_mem_id);

}
