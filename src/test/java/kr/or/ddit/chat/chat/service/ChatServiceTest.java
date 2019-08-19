package kr.or.ddit.chat.chat.service;

import static org.junit.Assert.assertEquals;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.chat.chat.model.ChatVo;
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
	
	@Test
	public void deletChatTest() {
		/***Given***/
		int chat_id = 1;
		/***When***/
		int test = chatService.deletChat(chat_id);
		/***Then***/
		assertEquals(1, test);
	}

	@Test
	public void insertChatTest() {
		/***Given***/
		
		ChatVo chatVo = new ChatVo("test","aha");
		/***When***/
		int test = chatService.insertChat(chatVo);
		/***Then***/
		assertEquals(1, test);
		assertEquals(25, chatVo.getChat_id());
	}


}
