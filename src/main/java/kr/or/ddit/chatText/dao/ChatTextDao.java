package kr.or.ddit.chatText.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ChatTextDao implements IChatTextDao {
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
	
}
