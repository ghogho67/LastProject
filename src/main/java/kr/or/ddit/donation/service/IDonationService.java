package kr.or.ddit.donation.service;

import kr.or.ddit.approval.model.ApprovalVo;
import kr.or.ddit.donation.model.DonationVo;

public interface IDonationService {
	
	/**
	* Method : insertDonation
	* 작성자 : ADMIN
	* 변경이력 :
	* @param donationVo
	* @return
	* Method 설명 :기부 등록 - donation
	*/
	int insertDonation(DonationVo donationVo);
	
	/**
	* Method : insertDonationApproval
	* 작성자 : ADMIN
	* 변경이력 :
	* @param approvalVo
	* @return
	* Method 설명 :기부 등록 - approval
	*/
	int insertDonationApproval(ApprovalVo approvalVo);
	
	/**
	* Method : currentApproval
	* 작성자 : ADMIN
	* 변경이력 :
	* @return
	* Method 설명 : 가장 최근 결제 아이디 가져오기
	*/
	int currentApproval();


}
