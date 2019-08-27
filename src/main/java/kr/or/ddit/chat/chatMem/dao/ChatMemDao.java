package kr.or.ddit.chat.chatMem.dao;

import java.util.List;
import java.util.Map;

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

	@Override
	public int messageUpdate(Map<String, Object> map) {
		return sqlSession.update("chatMem.messageUpdate",map);
	}

	@Override
	public String selectChatmemid(Map<String, Object> map) {
		return sqlSession.selectOne("chatMem.selectChatmemid", map);
	}

	@Override
	public List<ChatMemVo> selectChatmemVoList(String mem_id) {
		return sqlSession.selectList("chatMem.selectChatmemVoList", mem_id);
	}

	@Override
	public int messageUpdateN(int chat_id) {
		return sqlSession.update("chatMem.messageUpdateN", chat_id);
	}

	
}
