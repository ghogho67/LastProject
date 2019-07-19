package kr.or.ddit.lecture.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class LectureDao implements ILectureDao {
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
}
