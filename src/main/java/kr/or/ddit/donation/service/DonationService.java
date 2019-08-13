package kr.or.ddit.donation.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

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
	* @return
	* Method 설명 : 기부 등록 -donation
	*/
	@Override
	public int insertDonation(DonationVo donationVo) {
		return donationDao.insertDonation(donationVo);
	}

	/**
	* Method : getDonationApproval
	* 작성자 : ADMIN
	* 변경이력 :
	* @param app_id
	* @return
	* Method 설명 :특정 기부자 가져오기
	*/
	@Override
	public DonationApprovalVo getDonationApproval(int app_id) {
		return donationDao.getDonationApproval(app_id);
	}

	
}
