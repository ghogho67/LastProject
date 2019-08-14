package kr.or.ddit.chat.chatMem.dao;

import static org.junit.Assert.assertEquals;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.chat.chatMem.model.ChatMemVo;
import kr.or.ddit.testenv.LogicTestEnv;

public class ChatMemDaoTest extends LogicTestEnv {

	
	@Resource(name = "chatMemDao")
	private IChatMemDao chaMemtDao;
	
	@Test
	public void insertChatMemTest() {
		/***Given***/
		String mem_id = "aha";
		int chat_id = 24;
		ChatMemVo chatMemVo = new ChatMemVo(chat_id,mem_id);
		
		/***When***/
		int test = chaMemtDao.insertChatMem(chatMemVo);
		/***Then***/
		assertEquals(1, test);
	}
}
