package kr.or.ddit.donation.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.donation.model.DonationVo;
import kr.or.ddit.joinVo.DonationApprovalVo;
import kr.or.ddit.page.model.PageVo;


@Repository
public class DonationDao implements IDonationDao {

	@Resource(name="sqlSession")
	private SqlSessionTemplate sqlSession;

	/**
	* Method : insertDonation
	* 작성자 : ADMIN
	* 변경이력 :
	* @return
	* Method 설명 : 기부 등록  비회원-donation
	*/
	@Override
	public int insertDonation_non(DonationVo donationVo) {
		return sqlSession.insert("donation.insertDonation_non",donationVo);
	}
	
	/**
	* Method : insertDonation_mem
	* 작성자 : ADMIN
	* 변경이력 :
	* @param donationVo
	* @return
	* Method 설명 :기부 등록  회원-donation
	*/
	@Override
	public int insertDonation_mem(DonationVo donationVo) {
		return sqlSession.insert("donation.insertDonation_mem",donationVo);
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

	/**
	* Method : getAllDonerList
	* 작성자 : ADMIN
	* 변경이력 :
	* @return
	* Method 설명 : 전체 기부자 목록 가져오기
	*/
	@Override
	public List<DonationApprovalVo> getAllDonerList() {
		return sqlSession.selectList("donationApproval.getAllDonerList");
	}

	/**
	* Method : getDoner_memYN
	* 작성자 : ADMIN
	* 변경이력 :
	* @param mem_yn
	* @return
	* Method 설명 : 기부자 증 회원/ 비회원 목록 가져오기
	*/
	@Override
	public List<DonationApprovalVo> getDoner_memYN(String mem_yn) {
		return sqlSession.selectList("donationApproval.getDoner_memYN",mem_yn);
	}

	/**
	* Method : donerCnt
	* 작성자 : ADMIN
	* 변경이력 :
	* @return
	* Method 설명 :기부자 전체 수 조회
	*/
	@Override
	public int donerCnt() {
		return sqlSession.selectOne("donationApproval.donerCnt");
	}

	/**
	* Method : donationPagingList
	* 작성자 : ADMIN
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : 기부자 페이징 리스트
	*/
	@Override
	public List<DonationApprovalVo> donationPagingList(PageVo pageVo) {
		return sqlSession.selectList("donationApproval.donationPagingList",pageVo);
	}



}
