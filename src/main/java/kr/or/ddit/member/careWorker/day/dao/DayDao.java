package kr.or.ddit.member.careWorker.day.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class DayDao implements IDayDao {

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqSession;
}
