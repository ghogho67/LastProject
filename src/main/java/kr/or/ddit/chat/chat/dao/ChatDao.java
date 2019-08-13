package kr.or.ddit.chat.chat.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.joinVo.ChatMemListVo;

@Repository
public class ChatDao implements IChatDao{

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ChatMemListVo> chatList(String mem_id) {
		return sqlSession.selectList("chat.chatList",mem_id);
	}
}
