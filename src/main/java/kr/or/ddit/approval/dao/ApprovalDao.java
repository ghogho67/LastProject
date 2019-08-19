package kr.or.ddit.approval.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.approval.model.ApprovalVo;

@Repository
public class ApprovalDao implements IApprovalDao {

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

}
