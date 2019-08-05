package kr.or.ddit.category.others.nursingHome.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class NursingHomeDao implements INursingHomeDao {

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
	
	
	
}
