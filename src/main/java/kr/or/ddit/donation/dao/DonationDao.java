package kr.or.ddit.donation.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
	* @return
	* Method 설명 : 기부 등록 -donation
	*/
	@Override
	public int insertDonation(DonationVo donationVo) {
		return sqlSession.insert("donation.insertDonation",donationVo);
	}

	/**
	* Method : getDonationApproval
	* 작성자 : ADMIN
	* 변경이력 :
	* @param app_id
	* @return
	* Method 설명 :특정 기부자 정보 가져오기
	*/
	@Override
	public DonationApprovalVo getDonationApproval(int app_id) {
		return sqlSession.selectOne("donationApproval.getDonationApproval",app_id);
	}
	
	

	

}
