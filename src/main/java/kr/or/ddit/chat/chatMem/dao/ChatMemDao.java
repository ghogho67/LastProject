package kr.or.ddit.chat.chatMem.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.chat.chatMem.model.ChatMemVo;

@Repository
public class ChatMemDao implements IChatMemDao {

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertChatMem(ChatMemVo chatMemVo) {
		return sqlSession.insert("chatMem.insertChatMem",chatMemVo);
	}

	
}
