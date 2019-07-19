package kr.or.ddit.type.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class TypeDao implements ITypeDao {

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
	
}
