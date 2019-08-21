package kr.or.ddit.approval.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.approval.model.ApprovalVo;
import kr.or.ddit.joinVo.AttendanceMatchingVo;
import kr.or.ddit.page.model.PageVo;

public interface IApprovalDao {

	int approvalInsert(ApprovalVo avo);

	int approvalDelete(int app_id);

	ApprovalVo getApproval(int app_id);

	List<ApprovalVo> approvalList(String mem_id);
	
	/**
	* Method : insertApproval_mem
	* 작성자 : ADMIN
	* 변경이력 :
	* @param approvalVo
	* @return
	* Method 설명 :기부 등록 - 회원
	*/
	int insertApproval_mem(ApprovalVo approvalVo);
	
	/**
	* Method : insertApproval_non
	* 작성자 : ADMIN
	* 변경이력 :
	* @param approvalVo
	* @return
	* Method 설명 :기부등록 - 비회원
	*/
	int insertApproval_non(ApprovalVo approvalVo);
	
	/**
	* Method : currentApproval
	* 작성자 : ADMIN
	* 변경이력 :
	* @return
	* Method 설명 :가장 최근 app_id찾기
	*/
	int currentApproval();
	
	
	/**
	* Method : approvalPageList
	* 작성자 : PC21
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : mem_id 를 검색하여 리스트 갖고오고 페이지네이션
	*/
	List<ApprovalVo> approvalPageList(Map<String, Object> map);
	
	

	
	int approvalPageCnt(String mem_id);
	
	
	
	
	/**
	* Method : daySaerchList
	* 작성자 : PC21
	* 변경이력 :
	* @param resultMap
	* @return
	* Method 설명 : 날짜별로 검색하여 리스트 갖고오기
	*/
	public List<ApprovalVo> daySaerchList(Map<String, Object> resultMap); 
	public int daySaerchCnt(Map<String, Object> day);
	
	
	/**
	* Method : typeSaerchList
	* 작성자 : PC21
	* 변경이력 :
	* @param resultMap
	* @return
	* Method 설명 : 타입별로 검색하여 리스트 갖고오기
	*/
	public List<ApprovalVo> typeSaerchList(Map<String, Object> resultMap); 
	
	public int typeSaerchCnt(Map<String, Object> type);
	
	/**
	* Method : approvalPagingList
	* 작성자 : ADMIN
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 :결제자 전체 목록 페이지네이션
	*/
	List<ApprovalVo> approvalAllPagingList(PageVo pageVo);
	
	/**
	* Method : approvalCnt
	* 작성자 : ADMIN
	* 변경이력 :
	* @return
	* Method 설명 :결제자 전체 목록 가져오기
	*/
	int approvalAllCnt();
	
	/**
	* Method : approvalAllList
	* 작성자 : ADMIN
	* 변경이력 :
	* @return
	* Method 설명 :결제자 전체 리스트
	*/
	List<ApprovalVo> approvalAllList();
	
	/**
	* Method : gradeApproval
	* 작성자 : ADMIN
	* 변경이력 :
	* @param mem_grade
	* @return
	* Method 설명 :결산관리 - 등급별 결제액 
	*/
	int gradeApproval(String mem_grade);

}
