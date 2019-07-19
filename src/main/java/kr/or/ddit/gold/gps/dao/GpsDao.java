package kr.or.ddit.gold.gps.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class GpsDao implements IGpsDao {
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
	
}
