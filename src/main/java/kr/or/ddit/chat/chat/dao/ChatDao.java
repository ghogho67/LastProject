package kr.or.ddit.chat.chat.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ChatDao implements IChatDao{

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
}
