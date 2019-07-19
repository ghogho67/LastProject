package kr.or.ddit.category.post.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PostDao implements IPostDao{

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
}
