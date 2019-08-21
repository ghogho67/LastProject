package kr.or.ddit.matching.matching.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.matching.matching.model.MatchingVo;
import kr.or.ddit.member.member.model.MemberVo;

public interface IMatchingDao {

	int matchingDelete(int mat_id);

	MatchingVo getMatchingVo(int mat_id);

	int matchingModify(MatchingVo mvo);

	int matchingCreate(MatchingVo mvo);
	
	List<MemberVo> getCareWorker();
	
	List<MatchingVo> getMatchingList(String cw_mem_id);
	
	List<MatchingVo> getCWMatchingList(String cw_mem_id);

	List<MatchingVo> getMemMatchingList(String mem_id);

	int memMatchingCnt(String mem_id);

	int cwMatchingCnt(String cw_mem_id);

	List<MatchingVo> memMatchingPagingList(Map<String, Object> map);

	List<MatchingVo> cwMatchingPagingList(Map<String, Object> map);


}
