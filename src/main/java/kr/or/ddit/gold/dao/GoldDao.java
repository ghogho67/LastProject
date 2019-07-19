package kr.or.ddit.gold.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class GoldDao implements IGoldDao{
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
	
}
