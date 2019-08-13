package kr.or.ddit.donation.dao;

import kr.or.ddit.donation.model.DonationVo;
import kr.or.ddit.joinVo.DonationApprovalVo;

public interface IDonationDao {
	
	/**
	* Method : insertDonation
	* 작성자 : ADMIN
	* 변경이력 :
	* @return
	* Method 설명 : 기부 등록 -donation
	*/
	int insertDonation(DonationVo donationVo);
	
	/**
	* Method : getDonationApproval
	* 작성자 : ADMIN
	* 변경이력 :
	* @param app_id
	* @return
	* Method 설명 :특정 기부자 가져오기
	*/
	DonationApprovalVo getDonationApproval(int app_id);
}
