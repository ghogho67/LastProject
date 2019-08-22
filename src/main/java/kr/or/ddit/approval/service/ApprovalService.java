package kr.or.ddit.approval.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.ddit.approval.dao.IApprovalDao;
import kr.or.ddit.approval.model.ApprovalVo;
import kr.or.ddit.joinVo.MemberApprovalVo;
import kr.or.ddit.page.model.PageVo;

@Service
public class ApprovalService implements IApprovalService {
	
	private static final Logger logger = LoggerFactory.getLogger(ApprovalService.class);

	@Resource(name = "approvalDao")
	private IApprovalDao approvalDao;

	@Override
	public int approvalInsert(ApprovalVo avo) {
		return approvalDao.approvalInsert(avo);
	}

	@Override
	public int approvalDelete(int app_id) {
		return approvalDao.approvalDelete(app_id);
	}

	@Override
	public ApprovalVo getApproval(int app_id) {
		return approvalDao.getApproval(app_id);
	}

	@Override
	public List<ApprovalVo> approvalList(String mem_id) {
		return approvalDao.approvalList(mem_id);
	}

	/**
	* Method : insertApproval_mem
	* 작성자 : ADMIN
	* 변경이력 :
	* @param approvalVo
	* @return
	* Method 설명 :기부 등록 - 회원
	*/
	@Override
	public int insertApproval_mem(ApprovalVo approvalVo) {
		return approvalDao.insertApproval_mem(approvalVo);
	}

	/**
	* Method : insertApproval_non
	* 작성자 : ADMIN
	* 변경이력 :
	* @param approvalVo
	* @return
	* Method 설명 :기부등록 - 비회원
	*/
	@Override
	public int insertApproval_non(ApprovalVo approvalVo) {
		return approvalDao.insertApproval_non(approvalVo);
	}

	/**
	* Method : currentApproval
	* 작성자 : ADMIN
	* 변경이력 :
	* @return
	* Method 설명 :가장 최근 app_id찾기
	*/
	@Override
	public int currentApproval() {
		return approvalDao.currentApproval();
	}

	@Override
	public Map<String, Object> approvalPageList(Map<String, Object> map) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("approvalPageList", approvalDao.approvalPageList(map));

		
		String mem_id = (String) map.get("mem_id");
		int memAllCnt = approvalDao.approvalPageCnt(mem_id);
		int pageSize = (int)map.get("pageSize");
		
		int paginationSize = (int) Math.ceil((double)memAllCnt/pageSize);
		resultMap.put("lastpaginationSize", paginationSize);
		
		return resultMap;
	}
	@Override
	public Map<String, Object> typeSaerchList(Map<String, Object> map) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		logger.debug("☞map:{}",map);
		List<ApprovalVo> list = approvalDao.typeSaerchList(map);
		resultMap.put("typeSaerchList", list);
		
		logger.debug("☞list:{}",list);

		
		String mem_id = (String) map.get("mem_id");
		int app_type = (int) map.get("app_type");
		Map<String, Object> cnttMap = new HashMap<String, Object>();
		cnttMap.put("mem_id", mem_id);
		cnttMap.put("app_type", app_type);
		int memAllCnt = approvalDao.typeSaerchCnt(cnttMap);
		int pageSize = (int)map.get("pageSize");
		
		int paginationSize = (int) Math.ceil((double)memAllCnt/pageSize);
		resultMap.put("lastpaginationSize", paginationSize);
		return resultMap;
	}
	
	

	@Override
	public Map<String, Object> daySaerchList(Map<String, Object> map) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("daySaerchList", approvalDao.daySaerchList(map));

		
		String mem_id = (String) map.get("mem_id");
		String app_time = (String) map.get("app_time");
		Map<String, Object> cnttMap = new HashMap<String, Object>();
		cnttMap.put("mem_id", mem_id);
		cnttMap.put("app_time", app_time);
		int memAllCnt = approvalDao.daySaerchCnt(cnttMap);
		int pageSize = (int)map.get("pageSize");
		
		int paginationSize = (int) Math.ceil((double)memAllCnt/pageSize);
		resultMap.put("lastpaginationSize", paginationSize);
		
		return resultMap;
	}

	/**
	* Method : approvalPagingList
	* 작성자 : ADMIN
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : 결제자 전체 정보 페이지네이션
	*/
	@Override
	public Map<String, Object> approvalAllPagingList(PageVo pageVo) {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("memberApprovalAllList", approvalDao.approvalAllPagingList(pageVo));
		
		int memberApprovalAllCnt = approvalDao.memberApprovalAllCnt();
		int paginationSize = (int) Math.ceil((double)memberApprovalAllCnt/pageVo.getPageSize());
		resultMap.put("lastpaginationSize", paginationSize);
		
		return resultMap;
	}


	/**
	* Method : gradeApproval
	* 작성자 : ADMIN
	* 변경이력 :
	* @param mem_grade
	* @return
	* Method 설명 :결산관리 - 등급별 결제액 
	*/
	@Override
	public int gradeApproval(String mem_grade) {
		return approvalDao.gradeApproval(mem_grade);
	}

	/**
	* Method : memberApprovalAllList
	* 작성자 : ADMIN
	* 변경이력 :
	* @return
	* Method 설명 :결제 전체 리스트 - MemberApprovalVo 조인Vo사용
	*/
	@Override
	public List<MemberApprovalVo> memberApprovalAllList() {
		return approvalDao.memberApprovalAllList();
	}

	/**
	* Method : totalApproval_admin
	* 작성자 : ADMIN
	* 변경이력 :
	* @return
	* Method 설명 :결산관리(관리자) - 매출 전체
	*/
	@Override
	public int totalApproval_admin() {
		return approvalDao.totalApproval_admin();
	}

	/**
	* Method : totalApprovalType_admin
	* 작성자 : ADMIN
	* 변경이력 :
	* @param app_type
	* @return
	* Method 설명 :결산관리(관리자 ) - 결제 타입별 매출
	*/
	@Override
	public int totalApprovalType_admin(String app_type) {
		return approvalDao.totalApprovalType_admin(app_type);
	}
	
	
	
	

}
