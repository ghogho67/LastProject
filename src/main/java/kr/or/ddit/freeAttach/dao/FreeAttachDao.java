package kr.or.ddit.freeAttach.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class FreeAttachDao implements IFreeAttachDao{
	
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

}
