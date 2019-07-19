package kr.or.ddit.m_cate.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class M_cateDao implements IM_cateDao {
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
	
}
