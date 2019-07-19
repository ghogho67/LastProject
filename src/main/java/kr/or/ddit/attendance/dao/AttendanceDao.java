package kr.or.ddit.attendance.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AttendanceDao implements IAttendanceDao {

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
}
