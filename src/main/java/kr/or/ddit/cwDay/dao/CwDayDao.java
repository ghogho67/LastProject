package kr.or.ddit.cwDay.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CwDayDao implements ICwDayDao{

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
}
