package kr.or.ddit.freeReply.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class FreeReplyDao implements IFreeReplyDao{
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

}
