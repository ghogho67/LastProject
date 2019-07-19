package kr.or.ddit.report.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ReportDao implements IReportDao {
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
	
}
