package kr.or.ddit.member.careWorker.location.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class LocationDao implements ILocationDao {

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
}
