package kr.or.ddit.matching.matching.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.matching.matching.model.MatchingVo;
import kr.or.ddit.member.member.model.MemberVo;

public interface IMatchingDao {

	/**
	* Method : matchingDelete
	* 작성자 : 정요한
	* 변경이력 :
	* @param mat_id
	* @return
	* Method 설명 : 매칭 삭제
	*/
	int matchingDelete(int mat_id);

	/**
	* Method : getMatchingVo
	* 작성자 : 정요한
	* 변경이력 :
	* @param mat_id
	* @return
	* Method 설명 : 매칭 가져오기
	*/
	MatchingVo getMatchingVo(int mat_id);

	/**
	* Method : matchingModify
	* 작성자 : 정요한
	* 변경이력 :
	* @param mvo
	* @return
	* Method 설명 : 매칭 수정
	*/
	int matchingModify(MatchingVo mvo);

	/**
	* Method : matchingCreate
	* 작성자 : 정요한
	* 변경이력 :
	* @param mvo
	* @return
	* Method 설명 : 매칭 create
	*/
	int matchingCreate(MatchingVo mvo);
	
	/**
	* Method : getCareWorker
	* 작성자 : 정요한
	* 변경이력 :
	* @return
	* Method 설명 : 요양보호사 리스트
	*/
	List<MemberVo> getCareWorker();
	
	/**
	* Method : getMatchingList
	* 작성자 : 정요한
	* 변경이력 :
	* @param cw_mem_id
	* @return
	* Method 설명 : 매칭 리스트
	*/
	List<MatchingVo> getMatchingList(String cw_mem_id);
	
	/**
	* Method : getCWMatchingList
	* 작성자 : 정요한
	* 변경이력 :
	* @param cw_mem_id
	* @return
	* Method 설명 : 요양 보호사 매칭 리스트
	*/
	List<MatchingVo> getCWMatchingList(String cw_mem_id);

	/**
	* Method : getMemMatchingList
	* 작성자 : 정요한
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 회원 매칭 리스트
	*/
	List<MatchingVo> getMemMatchingList(String mem_id);

	/**
	* Method : memMatchingCnt
	* 작성자 : 정요한
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 회원 매칭 갯수
	*/
	int memMatchingCnt(String mem_id);

	/**
	* Method : cwMatchingCnt
	* 작성자 : 정요한
	* 변경이력 :
	* @param cw_mem_id
	* @return
	* Method 설명 : 요양보호사 매칭 갯수
	*/
	int cwMatchingCnt(String cw_mem_id);

	/**
	* Method : memMatchingPagingList
	* 작성자 : 정요한
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 회원 매칭 페이징
	*/
	List<MatchingVo> memMatchingPagingList(Map<String, Object> map);

	/**
	* Method : cwMatchingPagingList
	* 작성자 : 정요한
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 요양보호사 매칭 페이징
	*/
	List<MatchingVo> cwMatchingPagingList(Map<String, Object> map);


}
