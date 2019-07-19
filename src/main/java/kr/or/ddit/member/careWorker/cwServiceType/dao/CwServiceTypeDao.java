package kr.or.ddit.member.careWorker.cwServiceType.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CwServiceTypeDao implements ICwServiceTypeDao {

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
	
}
