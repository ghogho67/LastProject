package kr.or.ddit.grade.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class GradeDao implements IGradeDao {
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

}
