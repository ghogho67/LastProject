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
	* Method : approvalAllListTest
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 : 결제자 리스트 조회
	*/
	@Test
	public void approvalAllListTest() {
		/***Given***/

		/***When***/
		List<ApprovalVo> approvalAllList = approvalService.approvalAllList();
		/***Then***/
		assertEquals(59, approvalAllList.size());

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
		logger.debug("☞pageVo:{}",pageVo);
		
		/***When***/
		Map<String, Object> resultMap = approvalService.approvalAllPagingList(pageVo);
		logger.debug("☞resultMap:{}",resultMap);
		List<ApprovalVo> approvalAllList = (List<ApprovalVo>) resultMap.get("approvalAllList");
		logger.debug("☞approvalAllList:{}",approvalAllList);
		int paginationSize = (Integer) resultMap.get("lastpaginationSize");
		logger.debug("☞paginationSize:{}",paginationSize);
		/***Then***/
		assertEquals(7, paginationSize);

	}

}
