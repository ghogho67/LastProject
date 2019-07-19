package kr.or.ddit.freeboard.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class FreeboardDao implements IFreeboardDao {
	
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

}
