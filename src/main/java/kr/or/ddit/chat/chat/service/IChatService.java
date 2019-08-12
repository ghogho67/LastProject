package kr.or.ddit.chat.chat.service;

import java.util.List;

import kr.or.ddit.joinVo.ChatMemListVo;

public interface IChatService {
	public List<ChatMemListVo> chatList(String mem_id);
}
