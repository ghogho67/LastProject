package kr.or.ddit.career.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CareerDao implements ICareerDao {

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
	
	
	
}
