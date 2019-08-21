package kr.or.ddit.donation.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.donation.model.DonationVo;
import kr.or.ddit.joinVo.DonationApprovalVo;
import kr.or.ddit.page.model.PageVo;

public interface IDonationService {
	
	/**
	* Method : insertDonation_non
	* 작성자 : ADMIN
	* 변경이력 :
	* @return
	* Method 설명 : 기부 등록 비회원-donation
	*/
	int insertDonation_non(DonationVo donationVo);
	
	/**
	* Method : insertDonation_mem
	* 작성자 : ADMIN
	* 변경이력 :
	* @param donationVo
	* @return
	* Method 설명 :기부 등록 회원-donation
	*/
	int insertDonation_mem(DonationVo donationVo);
	
	/**
	* Method : getDonationApproval
	* 작성자 : ADMIN
	* 변경이력 :
	* @param app_id
	* @return
	* Method 설명 :특정 기부자 가져오기
	*/
	DonationApprovalVo getDonationApproval(int app_id);
	
	/**
	* Method : getAllDonerList
	* 작성자 : ADMIN
	* 변경이력 :
	* @return
	* Method 설명 : 전체 기부자 목록 가져오기
	*/
	List<DonationApprovalVo> getAllDonerList();
	
	/**
	* Method : getDoner_memYN
	* 작성자 : ADMIN
	* 변경이력 :
	* @param mem_yn
	* @return
	* Method 설명 : 기부자 증 회원/ 비회원 목록 가져오기
	*/
	List<DonationApprovalVo> getDoner_memYN(String mem_yn); 
	
	/**
	* Method : donationPagingList
	* 작성자 : ADMIN
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 :기부자 페이징 리스트
	*/
	Map<String, Object> donationPagingList(PageVo pageVo);
	
	/**
	* Method : getDonationList_Y
	* 작성자 : ADMIN
	* 변경이력 :
	* @param mem_yn
	* @return
	* Method 설명 :회원 리스트 조회
	*/
	List<DonationApprovalVo> getDonationList_Y();
	
	/**
	 * Method : getDonationList_N
	 * 작성자 : ADMIN
	 * 변경이력 :
	 * @param mem_yn
	 * @return
	 * Method 설명 :비회원 리스트 조회
	 */
	List<DonationApprovalVo> getDonationList_N();
	
	/**
	* Method : donationPagingList_Y
	* 작성자 : ADMIN
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 :회원 기부자 페이징 리스트
	*/
	Map<String, Object> donationPagingList_Y(PageVo pageVo);
	
	/**
	* Method : donationPagingList_N
	* 작성자 : ADMIN
	* 변경이력 :
	* @param pgeVo
	* @return
	* Method 설명 :비회원 기부자 페이징 리스트
	*/
	Map<String, Object> donationPagingList_N(PageVo pageVo);
	
	

}
