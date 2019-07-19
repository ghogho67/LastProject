package kr.or.ddit.hospitalType.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class HospitalTypeDao {
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
}
