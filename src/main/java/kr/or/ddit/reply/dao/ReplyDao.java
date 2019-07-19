package kr.or.ddit.reply.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDao implements IReplyDao {
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
	
}
