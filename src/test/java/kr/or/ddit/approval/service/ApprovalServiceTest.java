package kr.or.ddit.approval.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.approval.model.ApprovalVo;
import kr.or.ddit.testenv.LogicTestEnv;

public class ApprovalServiceTest extends LogicTestEnv {

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

}
