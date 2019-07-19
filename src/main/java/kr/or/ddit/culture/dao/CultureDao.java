package kr.or.ddit.culture.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CultureDao implements ICultureDao {
	
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

}
