package kr.or.ddit.gold.sos.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SosDao implements ISosDao {

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
}
