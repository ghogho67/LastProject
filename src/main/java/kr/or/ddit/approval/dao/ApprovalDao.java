package kr.or.ddit.approval.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ApprovalDao implements IApprovalDao{
	
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
}
