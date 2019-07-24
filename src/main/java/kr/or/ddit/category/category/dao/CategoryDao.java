package kr.or.ddit.category.category.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDao implements ICategoryDao {
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

}
