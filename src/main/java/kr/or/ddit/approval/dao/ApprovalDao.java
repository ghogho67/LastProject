package kr.or.ddit.approval.dao;

import java.util.List;

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

}
