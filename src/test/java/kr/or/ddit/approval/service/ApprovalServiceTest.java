package kr.or.ddit.approval.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.approval.model.ApprovalVo;
import kr.or.ddit.joinVo.MemberApprovalVo;
import kr.or.ddit.page.model.PageVo;
import kr.or.ddit.testenv.LogicTestEnv;

public class ApprovalServiceTest extends LogicTestEnv {
	
	private static final Logger logger = LoggerFactory.getLogger(ApprovalServiceTest.class);

	@Resource(name = "approvalService")
	private IApprovalService approvalService;

	@Test
	public void approvalInsertServiceTest() {
		/*** Given ***/
		ApprovalVo avo = new ApprovalVo();
		avo.setApp_pay(50000);
		avo.setApp_type("방문간병");
		/*** When ***/
		int insertCnt = approvalService.approvalInsert(avo);
		/*** Then ***/
		assertNotNull(approvalService);
	}

	@Test
	public void approvalDeleteServiceTest() {

		/*** Given ***/
		int app_id = 1;
		/*** When ***/
		int deleteCnt = approvalService.approvalDelete(app_id);
		/*** Then ***/
		assertEquals(1, deleteCnt);
	}

	@Test
	public void approvalGetApprovalServiceTest() {
		/*** Given ***/
		int app_id = 1;
		/*** When ***/
		ApprovalVo avo = approvalService.getApproval(app_id);
		/*** Then ***/
		assertEquals(10000, avo.getApp_pay());
	}

	@Test
	public void approvalApprovalListServiceTest() {
		/*** Given ***/
		String mem_id = "brown";
		/*** When ***/
		List<ApprovalVo> appList = approvalService.approvalList(mem_id);
		/*** Then ***/
		assertEquals(20000, appList.get(0).getApp_pay());
	}
	

	
	/**
	* Method : approlvalAllPagingList
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 :결제 리스트 페이지 네이션
	*/
	@Test
	public void approlvalAllPagingList() {
		/***Given***/
		PageVo pageVo = new PageVo(1, 10);
		
		/***When***/
		Map<String, Object> resultMap = approvalService.approvalAllPagingList(pageVo);
		logger.debug("☞resultMap:{}",resultMap);
		List<MemberApprovalVo> memberApprovalAllList = (List<MemberApprovalVo>) resultMap.get("memberApprovalAllList");
		logger.debug("☞memberApprovalAllList:{}",memberApprovalAllList);
		int paginationSize = (Integer) resultMap.get("lastpaginationSize");
		logger.debug("☞paginationSize:{}",paginationSize);
		/***Then***/
		assertEquals(476, paginationSize);
	}
	
	/**
	* Method : gradeApprovalTest
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 :결산관리 - 등급별 결제액 
	*/
	@Test
	public void gradeApprovalTest() {
		/***Given***/
		String mem_grade = "1";
		/***When***/
		int gradeApproval = approvalService.gradeApproval(mem_grade);
		/***Then***/
		assertEquals(1600000, gradeApproval);

	}
	
	/**
	* Method : memberApprovalAllListTest
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 :결제 전체 리스트 - MemberApprovalVo 조인Vo사용
	*/
	@Test
	public void memberApprovalAllListTest() {
		/***Given***/

		/***When***/
		List<MemberApprovalVo> memberApprovalAllList = approvalService.memberApprovalAllList();
		/***Then***/
		assertEquals(4758, memberApprovalAllList.size());
	}
	
	/**
	* Method : totalApproval_admin
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 :결산관리(관리자) - 매출 전체
	*/
	@Test
	public void totalApproval_admin() {
		/***Given***/

		/***When***/
		int totalApproval_admin = approvalService.totalApproval_admin();
		/***Then***/
		assertEquals(954713, totalApproval_admin);

	}
	
	/**
	* Method : totalApprovalType_admin
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 :결산관리(관리자 ) - 결제 타입별 매출
	*/
	@Test
	public void totalApprovalType_adminTest() {
		/***Given***/
		String app_type = "1";
		/***When***/
		int totalApprovalType_admin = approvalService.totalApprovalType_admin(app_type);
		/***Then***/
		assertEquals(240006, totalApprovalType_admin);
	}

}
