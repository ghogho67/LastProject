package kr.or.ddit.chat.chatMem.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ChatMemDao implements IChatMemDao {

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
}
