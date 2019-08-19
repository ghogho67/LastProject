package kr.or.ddit.donation.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.donation.dao.IDonationDao;
import kr.or.ddit.donation.model.DonationVo;
import kr.or.ddit.joinVo.DonationApprovalVo;
import kr.or.ddit.page.model.PageVo;

@Service
public class DonationService implements IDonationService {
	
	@Resource(name = "donationDao")
	private IDonationDao donationDao;

	/**
	* Method : insertDonation_non
	* 작성자 : ADMIN
	* 변경이력 :
	* @param donationVo
	* @return
	* Method 설명 :기부 등록 비회원-donation
	*/
	@Override
	public int insertDonation_non(DonationVo donationVo) {
		return donationDao.insertDonation_non(donationVo);
	}


	/**
	* Method : insertDonation_mem
	* 작성자 : ADMIN
	* 변경이력 :
	* @param donationVo
	* @return
	* Method 설명 :기부 등록 회원-donation
	*/
	@Override
	public int insertDonation_mem(DonationVo donationVo) {
		return donationDao.insertDonation_mem(donationVo);
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


	/**
	* Method : getAllDoner
	* 작성자 : ADMIN
	* 변경이력 :
	* @return
	* Method 설명 : 전체 기부자 목록 가져오기
	*/
	@Override
	public List<DonationApprovalVo> getAllDoner() {
		return donationDao.getAllDoner();
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
		return donationDao.getDoner_memYN(mem_yn);
	}


	/**
	* Method : donationPagingList
	* 작성자 : ADMIN
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 :기부자 페이징 리스트
	*/
	@Override
	public Map<String, Object> donationPagingList(PageVo pageVo) {
	
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("getAllDoner", donationDao.donationPagingList(pageVo));
		
		int donerCnt = donationDao.donerCnt();
		int paginationSize = (int) Math.ceil((double)donerCnt/pageVo.getPageSize());
		resultMap.put("paginationSize", paginationSize);
		
		return resultMap;
	}



	

	
}
