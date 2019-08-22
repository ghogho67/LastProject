package kr.or.ddit.approval.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.or.ddit.approval.model.ApprovalVo;
import kr.or.ddit.joinVo.MemberApprovalVo;
import kr.or.ddit.page.model.PageVo;

@Repository
public class ApprovalDao implements IApprovalDao {
	private static final Logger logger = LoggerFactory.getLogger(ApprovalDao.class);

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	@Override
	public int approvalInsert(ApprovalVo avo) {
		return sqlSession.insert("approval.insert", avo);
	}

	@Override
	public int approvalDelete(int app_id) {
		return sqlSession.update("approval.delete", app_id);
	}

	@Override
	public ApprovalVo getApproval(int app_id) {
		return sqlSession.selectOne("approval.getApproval", app_id);
	}

	@Override
	public List<ApprovalVo> approvalList(String mem_id) {
		return sqlSession.selectList("approval.approvalList", mem_id);
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
		return sqlSession.insert("approval.insertApproval_mem",approvalVo);
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
		logger.debug("☞approvalVo:{}",approvalVo);
		return sqlSession.insert("approval.insertApproval_non",approvalVo);
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
		return sqlSession.selectOne("approval.currentApproval");
	}
	
	
	/**
	* Method : approvalPageList
	* 작성자 : PC21
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : mem_id 를 검색하여 리스트 갖고오고 페이지네이션
	*/
	@Override
	public List<ApprovalVo> approvalPageList(Map<String, Object> map) {
		return sqlSession.selectList("approval.approvalPageList",map);
	}

	@Override
	public int approvalPageCnt(String mem_id) {
		return sqlSession.selectOne("approval.approvalCnt", mem_id);
	}
//==========================================검색 일반회원 =================================================
	@Override
	public List<ApprovalVo> daySaerchList(Map<String, Object> resultMap) {
		return sqlSession.selectList("approval.dayPageList", resultMap);
	}

	@Override
	public int daySaerchCnt(Map<String, Object> day) {
		return sqlSession.selectOne("approval.dayCnt", day);
	}

	@Override
	public List<ApprovalVo> typeSaerchList(Map<String, Object> resultMap) {
		return sqlSession.selectList("approval.typePageList", resultMap);
	}

	@Override
	public int typeSaerchCnt(Map<String, Object> type) {
		return sqlSession.selectOne("approval.typeCnt", type);
	}

//==========================================================================================================
	
	/**
	* Method : approvalPagingList
	* 작성자 : ADMIN
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 :결제자 전체 목록 페이지네이션
	*/
	@Override
	public List<ApprovalVo> approvalAllPagingList(PageVo pageVo) {
		return sqlSession.selectList("memberApproval.approvalAllPagingList",pageVo);
	}

	/**
	* Method : memberApprovalAllCnt
	* 작성자 : ADMIN
	* 변경이력 :
	* @return
	* Method 설명 :결제자 전체 수 가져오기
	*/
	@Override
	public int memberApprovalAllCnt() {
		return sqlSession.selectOne("memberApproval.memberApprovalAllCnt");
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
		return sqlSession.selectOne("memberApproval.gradeApproval",mem_grade);
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
		return sqlSession.selectList("memberApproval.memberApprovalAllList");
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
		return sqlSession.selectOne("memberApproval.totalApproval_admin");
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
		return sqlSession.selectOne("memberApproval.totalApprovalType_admin",app_type);
	}
	
	

}
