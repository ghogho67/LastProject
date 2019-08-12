package kr.or.ddit.chat.chat.service;

import static org.junit.Assert.assertEquals;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.joinVo.ChatMemListVo;
import kr.or.ddit.testenv.LogicTestEnv;

public class ChatServiceTest extends LogicTestEnv{
	@Resource(name = "chatService")
	private IChatService chatService;
	@Test
	public void chatListTest() {
		/***Given***/
		String mem_id = "aha";
		/***When***/
		List<ChatMemListVo>chatMemList = chatService.chatList(mem_id);
		/***Then***/
		assertEquals(2, chatMemList.size());
	}


}
