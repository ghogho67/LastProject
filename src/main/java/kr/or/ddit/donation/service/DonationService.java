package kr.or.ddit.donation.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.approval.model.ApprovalVo;
import kr.or.ddit.donation.dao.IDonationDao;
import kr.or.ddit.donation.model.DonationVo;
import kr.or.ddit.joinVo.DonationApprovalVo;

@Service
public class DonationService implements IDonationService {
	
	@Resource(name = "donationDao")
	private IDonationDao donationDao;

	/**
	* Method : insertDonation
	* 작성자 : ADMIN
	* 변경이력 :
	* @param donationVo
	* @return
	* Method 설명 :기부 등록 - donation
	*/
	@Override
	public int insertDonation(DonationVo donationVo) {
		return donationDao.insertDonation(donationVo);
	}

	/**
	* Method : insertDonationApproval
	* 작성자 : ADMIN
	* 변경이력 :
	* @param approvalVo
	* @return
	* Method 설명 :기부 등록 - approval
	*/
	@Override
	public int insertDonationApproval(ApprovalVo approvalVo) {
		return donationDao.insertDonationApproval(approvalVo);
	}

	/**
	* Method : currentApproval
	* 작성자 : ADMIN
	* 변경이력 :
	* @return
	* Method 설명 : 가장 최근 결제 아이디 가져오기
	*/
	@Override
	public int currentApproval() {
		return donationDao.currentApproval();
	}

	/**
	* Method : getDonationApproval
	* 작성자 : ADMIN
	* 변경이력 :
	* @param app_id
	* @return
	* Method 설명 : 특정 기부자 정보 가져오기
	*/
	@Override
	public DonationApprovalVo getDonationApproval(int app_id) {
		return donationDao.getDonationApproval(app_id);
	}

}
