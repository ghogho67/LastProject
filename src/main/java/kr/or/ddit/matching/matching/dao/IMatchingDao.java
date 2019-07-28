package kr.or.ddit.matching.matching.dao;

import kr.or.ddit.matching.matching.model.MatchingVo;

public interface IMatchingDao {

	int matchingDelete(int mat_id);

	MatchingVo getMatchingVo(int mat_id);

	int matchingModify(MatchingVo mvo);

	int matchingCreate(MatchingVo mvo);

}
