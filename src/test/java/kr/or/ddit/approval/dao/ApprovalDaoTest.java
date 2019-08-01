package kr.or.ddit.approval.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.approval.model.ApprovalVo;
import kr.or.ddit.testenv.LogicTestEnv;

public class ApprovalDaoTest extends LogicTestEnv {

	@Resource(name = "approvalDao")
	private IApprovalDao approvalDao;

	@Test
	public void approvalInsertDaoTest() {
		/*** Given ***/
		ApprovalVo avo = new ApprovalVo();
		avo.setApp_pay(50000);
		avo.setApp_type(3);
		/*** When ***/
		int insertCnt = approvalDao.approvalInsert(avo);
		/*** Then ***/
		assertNotNull(approvalDao);
	}

	@Test
	public void approvalDeleteDaoTest() {

		/*** Given ***/
		int app_id = 1;
		/*** When ***/
		int deleteCnt = approvalDao.approvalDelete(app_id);
		/*** Then ***/
		assertEquals(1, deleteCnt);
	}

	@Test
	public void approvalGetApprovalDaoTest() {
		/*** Given ***/
		int app_id = 1;
		/*** When ***/
		ApprovalVo avo = approvalDao.getApproval(app_id);
		/*** Then ***/
		assertEquals(10000, avo.getApp_pay());
	}

	@Test
	public void approvalApprovalListDaoTest() {
		/*** Given ***/
		String mem_id = "brown";
		/*** When ***/
		List<ApprovalVo> appList = approvalDao.approvalList(mem_id);
		/*** Then ***/
		assertEquals(20000, appList.get(0).getApp_pay());
	}

}
