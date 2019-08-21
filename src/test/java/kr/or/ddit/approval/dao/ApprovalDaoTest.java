package kr.or.ddit.approval.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.approval.model.ApprovalVo;
import kr.or.ddit.page.model.PageVo;
import kr.or.ddit.testenv.LogicTestEnv;

public class ApprovalDaoTest extends LogicTestEnv {

	@Resource(name = "approvalDao")
	private IApprovalDao approvalDao;

	@Test
	public void approvalInsertDaoTest() {
		/*** Given ***/
		ApprovalVo avo = new ApprovalVo();
		avo.setApp_pay(50000);
		avo.setApp_type("방문간병");
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
	
	@Test
	public void approvalPageListTest() {
		/*** Given ***/
		String mem_id = "brown";
		PageVo pageVo = new PageVo();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_id", mem_id);
		map.put("page", pageVo.getPage());
		map.put("pageSize", pageVo.getPageSize());
		/*** When ***/
		List<ApprovalVo> appList = approvalDao.approvalPageList(map);
		/*** Then ***/
		assertEquals(10, appList.size());
	}
	
	@Test
	public void typePageListTest() {
		/*** Given ***/
		String mem_id = "brown";
		String typeName = "기부";
		int app_type = 0;
		if(typeName.equals("기부")) {
			app_type = 3;
		}
				
				
		PageVo pageVo = new PageVo();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_id", mem_id);
		map.put("app_type", 3);
		map.put("page", 1);
		map.put("pageSize", 10);
		/*** When ***/
		List<ApprovalVo> appList = approvalDao.typeSaerchList(map);
		/*** Then ***/
		assertEquals(8, appList.size());
	}
	
	/**
	* Method : approvalCntTest
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 : 결제자 전체 수 조회
	*/
	@Test
	public void approvalCntTest() {
		/***Given***/

		/***When***/
		int approvalAllCnt = approvalDao.approvalAllCnt();
		/***Then***/
		assertEquals(61, approvalAllCnt);

	}
	
	/**
	* Method : approvalAllList
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 :결제 전체 리스트 조회
	*/
	@Test
	public void approvalAllList() {
		/***Given***/

		/***When***/
		List<ApprovalVo> approvalAllList = approvalDao.approvalAllList();
		/***Then***/
		assertEquals(61, approvalAllList.size());

	}
	
	/**
	* Method : approvalPagingListTest
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 :결제 페이지네이션
	*/
	@Test
	public void approvalPagingListTest() {
		/***Given***/
		PageVo pageVo = new PageVo(1, 10);
		/***When***/
		List<ApprovalVo> approvalPagingList = approvalDao.approvalAllPagingList(pageVo);
		/***Then***/
		assertEquals(10, approvalPagingList.size());

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
		int gradeApproval = approvalDao.gradeApproval(mem_grade);
		/***Then***/
		assertEquals(1600000, gradeApproval);

	}
	

}
