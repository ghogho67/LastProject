package kr.or.ddit.donation.doa;

import static org.junit.Assert.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.approval.dao.IApprovalDao;
import kr.or.ddit.approval.model.ApprovalVo;
import kr.or.ddit.donation.dao.IDonationDao;
import kr.or.ddit.donation.model.DonationVo;
import kr.or.ddit.joinVo.DonationApprovalVo;
import kr.or.ddit.page.model.PageVo;
import kr.or.ddit.testenv.LogicTestEnv;

public class DonationDaoTest extends LogicTestEnv{

	private static final Logger logger = LoggerFactory.getLogger(DonationDaoTest.class);
	
	@Resource(name = "donationDao")
	private IDonationDao donationDao;
	@Resource(name = "approvalDao")
	private IApprovalDao approvalDao;
	
	/**
	* Method : insertDonation_non
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 :기부등록 - donation
	*/
	@Test
	public void insertDonation_nonTest() {
		/***Given***/
		DonationVo donationVo = new DonationVo(64, "brown", "010-3256-7895", "좋은일에 써주세요",144, "N");
		/***When***/
		int insertDonation_nonCnt = donationDao.insertDonation_non(donationVo);
		
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
		int insertDonation_nonCnt = donationDao.insertDonation_mem(donationVo);
		
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
		approvalVo = new ApprovalVo(69, 10000, sdf.parse("2019-08-22"), "3", "brown", "N", "admin");
		/***When***/
		logger.debug("☞approvalVo:{}",approvalVo);
		int insertApproval_memCnt = approvalDao.insertApproval_mem(approvalVo);
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
		approvalVo = new ApprovalVo(48, 10000, sdf.parse("2019-08-22"), "3", "N", "admin");
		/***When***/
		logger.debug("☞approvalVo:{}",approvalVo);
		int insertApproval_nonCnt = approvalDao.insertApproval_non(approvalVo);
		/***Then***/
		assertEquals(1, insertApproval_nonCnt);
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
		int currentApproval = approvalDao.currentApproval();
		/***Then***/
		assertEquals(191, currentApproval);

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
		DonationApprovalVo getDonationApproval = donationDao.getDonationApproval(app_id);
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
		List<DonationApprovalVo> getAllDoner = donationDao.getAllDonerList();
		/***Then***/
		assertEquals(46, getAllDoner.size());

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
		List<DonationApprovalVo> getDoner_memYN = donationDao.getDoner_memYN("Y");
		/***Then***/
		assertEquals(21, getDoner_memYN.size());

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
		List<DonationApprovalVo> getDoner_memYN = donationDao.getDoner_memYN("N");
		/***Then***/
		assertEquals(25, getDoner_memYN.size());

	}
	
	/**
	* Method : donerCntTest
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 : 기부자 전체 수 
	*/
	@Test
	public void donerCntTest() {
		/***Given***/

		/***When***/
		int donerCnt = donationDao.donerCnt();
		/***Then***/
		assertEquals(46, donerCnt);

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
		PageVo pageVo = new PageVo(1,10);
		/***When***/
		List<DonationApprovalVo> donationPagingList = donationDao.donationPagingList(pageVo);
		/***Then***/
		assertEquals(10, donationPagingList.size());
	}
	

	

}
