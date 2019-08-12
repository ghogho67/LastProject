package kr.or.ddit.donation.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.approval.model.ApprovalVo;
import kr.or.ddit.donation.model.DonationVo;
import kr.or.ddit.joinVo.DonationApprovalVo;

@Repository
public class DonationDao implements IDonationDao {

	@Resource(name="sqlSession")
	private SqlSessionTemplate sqlSession;
	
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
		return sqlSession.insert("donation.insertDonation",donationVo);
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
		return sqlSession.insert("donation.insertDonationApproval",approvalVo);
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
		return sqlSession.selectOne("donation.currentApproval");
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
		return sqlSession.selectOne("donationApproval.getDonationApproval",app_id);
	}

	

}
