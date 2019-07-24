package kr.or.ddit.member.member.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.page.model.PageVo;

public interface IMemberService {
	/**
	 * Method : getMemList
	 * 작성자 : PC21
	 * 변경이력 : 
	 * @return
	 * Method 설명 : 사용자 전체 리스트 조회
	 */
	List<MemberVo> getMemList();
	

	
	/**
	 * Method : deleteMem
	 * 작성자 : PC21
	 * 변경이력 : 
	 * @param userId
	 * @return
	 * Method 설명 :사용자 삭제
	 */
	int deleteMem(String mem_id);
	
	/**
	 * Method : getMemVo
	 * 작성자 : PC21
	 * 변경이력 :
	 * @param userId
	 * @return
	 * Method 설명 : 사용자 정보조회
	 */
	MemberVo getMemVo(String mem_id);
	
	/**
	 * Method : memberCnt
	 * 작성자 : PC21
	 * 변경이력 :
	 * @return
	 * Method 설명 : 사용자 전체수 조회
	 */
	int memberCnt();
	
	/**
	 * Method : updateMem
	 * 작성자 : PC21
	 * 변경이력 :
	 * @param userVo
	 * @return
	 * Method 설명 :사용자 업데이트
	 */
	int updateMem(MemberVo memVo);
	
	
	/**
	 * Method : memPagingList
	 * 작성자 : PC21
	 * 변경이력 :
	 * @param pageVo
	 * @return
	 * Method 설명 : 사용자 페이징 
	 */
	List<MemberVo> memPagingList(PageVo pageVo);
	
	/**
	 * Method : getMemVo
	 * 작성자 : PC21
	 * 변경이력 :
	 * @param userId
	 * @return
	 * Method 설명 : 아이디찾기 정보 조회
	 */
	String getMem_Id(Map<String, String> memInfo);
	
	/**
	 * Method : getMemVo
	 * 작성자 : PC21
	 * 변경이력 :
	 * @param userId
	 * @return
	 * Method 설명 : 비밀번호 찾기 임시비밀번호 업데이트
	 */
	int passUpdate(Map<String, String> memInfo);


}
