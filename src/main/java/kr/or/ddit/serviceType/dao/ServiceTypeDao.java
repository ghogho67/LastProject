package kr.or.ddit.serviceType.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ServiceTypeDao implements IServiceTypeDao {

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;


}
