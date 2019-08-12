package kr.or.ddit.chat.chat.dao;

import java.util.List;

import kr.or.ddit.joinVo.ChatMemListVo;

public interface IChatDao {
	public List<ChatMemListVo> chatList(String mem_id);
}
