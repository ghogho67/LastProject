package kr.or.ddit.donation.dao;

import java.util.List;

import kr.or.ddit.donation.model.DonationVo;
import kr.or.ddit.joinVo.DonationApprovalVo;

public interface IDonationDao {
	
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
	* Method : getAllDoner
	* 작성자 : ADMIN
	* 변경이력 :
	* @return
	* Method 설명 : 전체 기부자 목록 가져오기
	*/
	List<DonationApprovalVo> getAllDoner();
	
	/**
	* Method : getDoner_memYN
	* 작성자 : ADMIN
	* 변경이력 :
	* @param mem_yn
	* @return
	* Method 설명 : 기부자 증 회원/ 비회원 목록 가져오기
	*/
	List<DonationApprovalVo> getDoner_memYN(String mem_yn); 
	
	
	
	
}
