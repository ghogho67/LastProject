package kr.or.ddit.matching.matching.dao;

import java.util.List;

import kr.or.ddit.matching.matching.model.MatchingVo;
import kr.or.ddit.member.member.model.MemberVo;

public interface IMatchingDao {

	int matchingDelete(int mat_id);

	MatchingVo getMatchingVo(int mat_id);

	int matchingModify(MatchingVo mvo);

	int matchingCreate(MatchingVo mvo);
	
	List<MemberVo> getCareWorker();
	

}
