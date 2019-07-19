package kr.or.ddit.matching.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MatchingDao implements IMatchingDao{
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
}
