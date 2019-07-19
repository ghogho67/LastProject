package kr.or.ddit.schedule.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ScheduleDao implements IScheduleDao {
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
}
