package kr.or.ddit.chat.chat.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.chat.chat.model.ChatVo;
import kr.or.ddit.joinVo.ChatMemListVo;

@Repository
public class ChatDao implements IChatDao{

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ChatMemListVo> chatList(String mem_id) {
		return sqlSession.selectList("chat.chatList",mem_id);
	}

	@Override
	public int deletChat(int chat_id) {
		return sqlSession.update("chat.deletChat",chat_id);
	}

	@Override
	public int insertChat(ChatVo chatVo) {
		return sqlSession.insert("chat.createChat",chatVo);
	}
}
