package kr.or.ddit.chat.chatText.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.chat.chatText.model.ChatTextVo;
import kr.or.ddit.joinVo.ChatCollectionVo;

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

	@Override
	public List<ChatCollectionVo> chatCntList(String mem_id) {
		return sqlSession.selectList("chatCollection.chatCntList", mem_id);
	}
	
}
