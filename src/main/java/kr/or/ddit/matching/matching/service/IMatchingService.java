package kr.or.ddit.matching.matching.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.matching.matching.model.MatchingVo;

public interface IMatchingService {

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
	* Method : matchingCreate
	* 작성자 : 정요한
	* 변경이력 :
	* @param vo
	* @return
	* Method 설명 : 매칭 등록
	*/
	int matchingCreate(MatchingVo vo);

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
	* Method 설명 : 요양보호사 매칭 리스트
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
	* Method : matchingPagingList
	* 작성자 : 정요한
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 매칭 페이징 리스트
	*/
	Map<String, Object> matchingPagingList(Map<String, Object> map);

}
