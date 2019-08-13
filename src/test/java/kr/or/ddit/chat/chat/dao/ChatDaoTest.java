package kr.or.ddit.chat.chat.dao;

import static org.junit.Assert.assertEquals;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.chat.chat.model.ChatVo;
import kr.or.ddit.joinVo.ChatMemListVo;
import kr.or.ddit.testenv.LogicTestEnv;

public class ChatDaoTest extends LogicTestEnv{
	
	@Resource(name = "chatDao")
	private IChatDao chatDao;
	
	@Test
	public void chatListTest() {
		/***Given***/
		String mem_id = "aha";
		/***When***/
		List<ChatMemListVo>chatMemList = chatDao.chatList(mem_id);
		/***Then***/
		assertEquals(2, chatMemList.size());
	}
	
	@Test
	public void deletChatTest() {
		/***Given***/
		int chat_id = 1;
		/***When***/
		int test = chatDao.deletChat(chat_id);
		/***Then***/
		assertEquals(1, test);
	}
	
	@Test
	public void insertChatTest() {
		/***Given***/
		
		ChatVo chatVo = new ChatVo("test","aha");
		/***When***/
		int test = chatDao.insertChat(chatVo);
		/***Then***/
		assertEquals(1, test);
		assertEquals(24, chatVo.getChat_id());
	}


}
