package kr.or.ddit.donation.service;

import static org.junit.Assert.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.approval.model.ApprovalVo;
import kr.or.ddit.donation.model.DonationVo;
import kr.or.ddit.joinVo.DonationApprovalVo;
import kr.or.ddit.testenv.LogicTestEnv;

public class DonationServiceTest extends LogicTestEnv {

	@Resource(name = "donationService")
	private IDonationService donationService;
	
	/**
	* Method : insertDonationTest
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 :기부등록 - donation
	*/
	@Test
	public void insertDonationTest() {
		/***Given***/
		DonationVo donationVo = null;
		donationVo = new DonationVo(1, "brown", "010-1236-4587", "좋은일에 써주세요", 1);
		/***When***/
		int insertDonationCnt = donationService.insertDonation(donationVo);
		/***Then***/
		assertEquals(1, insertDonationCnt);

	}
	
	/**
	* Method : insertDonationApprovalTest
	* 작성자 : ADMIN
	* 변경이력 :
	* @throws ParseException
	* Method 설명 :기부 등록 - approval
	*/
	@Test
	public void insertDonationApprovalTest() throws ParseException {
		/***Given***/
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		ApprovalVo approvalVo = null;
		approvalVo = new ApprovalVo(1, 10000, sdf.parse("2019-08-08"), "3", "", "N");
		/***When***/
		int insertDonationApproval = donationService.insertDonationApproval(approvalVo);

		/***Then***/
		assertEquals(1, insertDonationApproval);

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
		int app_id = 59;
		/***When***/
		DonationApprovalVo getDonationApproval = donationService.getDonationApproval(app_id);
		/***Then***/
		assertEquals("아무개1", getDonationApproval.getDoner());

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
		int currentApproval = donationService.currentApproval();
		/***Then***/
		assertEquals(47, currentApproval);
	}

}
