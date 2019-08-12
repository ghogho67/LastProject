package kr.or.ddit.chat.chat.dao;

import static org.junit.Assert.assertEquals;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

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


}
