package kr.or.ddit.donation.service;

import static org.junit.Assert.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.approval.model.ApprovalVo;
import kr.or.ddit.approval.service.IApprovalService;
import kr.or.ddit.donation.model.DonationVo;
import kr.or.ddit.joinVo.DonationApprovalVo;
import kr.or.ddit.page.model.PageVo;
import kr.or.ddit.testenv.LogicTestEnv;

public class DonationServiceTest extends LogicTestEnv {

	@Resource(name = "donationService")
	private IDonationService donationService;
	@Resource(name = "approvalService")
	private IApprovalService approvalService;
	
	/**
	* Method : insertDonation_non
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 :기부등록 - donation
	*/
	@Test
	public void insertDonation_nonTest() {
		/***Given***/
		DonationVo donationVo = new DonationVo(113, "brown", "010-3256-7895", "좋은일에 써주세요", 144, "N");
		/***When***/
		int insertDonation_nonCnt = donationService.insertDonation_non(donationVo);
		
		/***Then***/
		assertEquals(1, insertDonation_nonCnt);

	}
	
	/**
	* Method : insertDonation_memTest
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 :기부등록 - donation
	*/
	@Test
	public void insertDonation_memTest() {
		/***Given***/
		DonationVo donationVo = new DonationVo(113, "brown", "010-3256-7895", "좋은일에 써주세요", 144, "Y");
		/***When***/
		int insertDonation_nonCnt = donationService.insertDonation_mem(donationVo);
		
		/***Then***/
		assertEquals(1, insertDonation_nonCnt);

	}
	
	/**
	* Method : insertApproval_memTest
	* 작성자 : ADMIN
	* 변경이력 :
	* @throws ParseException
	* Method 설명 :기부등록 맴버 - approval
	*/
	@Test
	public void insertApproval_memTest() throws ParseException {
		/***Given***/
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		ApprovalVo approvalVo = null;
		approvalVo = new ApprovalVo(48, 10000, sdf.parse("2019-08-08"), "3", "brown", "N");
		/***When***/
		int insertApproval_memCnt = approvalService.insertApproval_mem(approvalVo);
		/***Then***/
		assertEquals(1, insertApproval_memCnt);
	}
	
	/**
	* Method : insertApproval_nonTest
	* 작성자 : ADMIN
	* 변경이력 :
	* @throws ParseException
	* Method 설명 :기부등록 비회원 - approval
	*/
	@Test
	public void insertApproval_nonTest() throws ParseException {
		/***Given***/
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		ApprovalVo approvalVo = null;
//		approvalVo = new ApprovalVo(48, 10000, sdf.parse("2019-08-08"), "3", "N");
		/***When***/
//		int insertApproval_nonCnt = approvalService.insertApproval_non(approvalVo);
		/***Then***/
//		assertEquals(1, insertApproval_nonCnt);
	}
	

	
	/**
	* Method : currentApprovalTest
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 : 최근 app_id 가져오기
	*/
	@Test
	public void currentApprovalTest() {
		/***Given***/

		/***When***/
		int currentApproval = approvalService.currentApproval();
		/***Then***/
		assertEquals(195, currentApproval);
	}
	
	/**
	* Method : getDonationApproval
	* 작성자 : ADMIN
	* 변경이력 :
	* @param app_id
	* @return
	* Method 설명 : 특정 기부자 정보 가져오기
	*/
	@Test
	public void getDonationApprovalTest() {
		/***Given***/
		int app_id = 148;
		/***When***/
		DonationApprovalVo getDonationApproval = donationService.getDonationApproval(app_id);
		/***Then***/
		assertEquals("이부자", getDonationApproval.getDoner());

	}
	
	/**
	* Method : getAllDonerTest
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 :전체 기부자 목록 가져오기
	*/
	@Test
	public void getAllDonerTest() {
		/***Given***/

		/***When***/
		List<DonationApprovalVo> getAllDoner = donationService.getAllDonerList();
		/***Then***/
		assertEquals(50, getAllDoner.size());

	}
	
	/**
	* Method : getDoner_memYNTest
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 :기부자 목록 중 회원목록만 가져오기
	*/
	@Test
	public void getDoner_memYTest() {
		/***Given***/

		/***When***/
		List<DonationApprovalVo> getDoner_memYN = donationService.getDoner_memYN("Y");
		/***Then***/
		assertEquals(24, getDoner_memYN.size());

	}

	/**
	* Method : getDoner_memYNTest
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 :기부자 목록 중 비회원목록만 가져오기
	*/
	@Test
	public void getDoner_memNTest() {
		/***Given***/

		/***When***/
		List<DonationApprovalVo> getDoner_memYN = donationService.getDoner_memYN("N");
		/***Then***/
		assertEquals(27, getDoner_memYN.size());

	}
	
	/**
	* Method : donationPagingListTest
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 :기부자 페이징 리스트
	*/
	@Test
	public void donationPagingListTest() {
		/***Given***/
		PageVo pageVo = new PageVo(1, 10);
		/***When***/
		Map<String , Object> resultMap = donationService.donationPagingList(pageVo);
		List<DonationApprovalVo> getAllDonerList = (List<DonationApprovalVo>) resultMap.get("getAllDonerList");
		int paginationSize = (Integer) resultMap.get("lastpaginationSize");
		/***Then***/
		assertEquals(6, paginationSize);

	}
	
	
}
