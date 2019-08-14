package kr.or.ddit.chat.chatMem.service;

import static org.junit.Assert.assertEquals;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.chat.chatMem.dao.IChatMemDao;
import kr.or.ddit.chat.chatMem.model.ChatMemVo;
import kr.or.ddit.testenv.LogicTestEnv;

public class ChatMemServiceTest extends LogicTestEnv{
	
	@Resource(name = "chatMemService")
	private IChatMemService chaMemService;
	
	@Test
	public void insertChatMemTest() {
		/***Given***/
		String mem_id = "aha";
		int chat_id = 24;
		ChatMemVo chatMemVo = new ChatMemVo(chat_id,mem_id);
		
		/***When***/
		int test = chaMemService.insertChatMem(chatMemVo);
		/***Then***/
		assertEquals(1, test);
	}
}
