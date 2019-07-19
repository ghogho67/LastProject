package kr.or.ddit.reportAttach.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ReportAttachDao implements IReportAttachDao {

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
	
}
