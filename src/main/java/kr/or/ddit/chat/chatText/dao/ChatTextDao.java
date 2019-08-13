package kr.or.ddit.chat.chatText.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.chat.chatText.model.ChatTextVo;

@Repository
public class ChatTextDao implements IChatTextDao {
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertChatText(ChatTextVo chatTextVo) {
		return sqlSession.insert("chatText.insertChatText", chatTextVo);
	}

	@Override
	public List<ChatTextVo> getChatTextList(int chat_id) {
		return sqlSession.selectList("chatText.chattextList", chat_id);
	}
	
}
