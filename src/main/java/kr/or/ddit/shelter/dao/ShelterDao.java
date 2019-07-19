package kr.or.ddit.shelter.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ShelterDao implements IShelterDao {
	
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
}
