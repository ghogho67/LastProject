package kr.or.ddit.chat.chatMem.dao;

import static org.junit.Assert.assertEquals;

import java.util.HashMap;
import java.util.Map;

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
	
	
	@Test
	public void messageUpdateTest() {
		/***Given***/
		String mem_id = "brown";
		int chat_id = 25;
		String newmsgyn = "N";
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_id", mem_id);
		map.put("chat_id", chat_id);
		map.put("newmsgyn", newmsgyn);
		
		
		/***When***/
		int test = chaMemtDao.messageUpdate(map);
		/***Then***/
		assertEquals(1, test);
	}
	
	@Test
	public void selectChatmemidTest() {
		/***Given***/
		String mem_id = "sona";
		int chat_id = 25;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_id", mem_id);
		map.put("chat_id", chat_id);
		
		
		/***When***/
		String test = chaMemtDao.selectChatmemid(map);
		/***Then***/
		assertEquals("brown", test);
	}
}
