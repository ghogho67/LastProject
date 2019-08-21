package kr.or.ddit.chat.chatText.dao;

import static org.junit.Assert.assertEquals;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.chat.chatText.model.ChatTextVo;
import kr.or.ddit.joinVo.ChatCollectionVo;
import kr.or.ddit.testenv.LogicTestEnv;

public class ChatTextDaoTest extends LogicTestEnv{
	
	@Resource(name = "chatTextDao")
	private IChatTextDao chatTextDao;
	@Test
	public void insertChatTextTest() {
		/***Given***/
		int chat_id = 1;
		String mem_id = "aha";
		String chattext_cont = "네 안녕하세요";
		
		ChatTextVo chatTextVo = new ChatTextVo(chat_id,mem_id,chattext_cont);
		

		/***When***/
		int test = chatTextDao.insertChatText(chatTextVo);

		/***Then***/
		assertEquals(1, test);
	}
	
	
	@Test
	public void getChatTextListTest() {
		/***Given***/
		int chat_id = 1;
		
		/***When***/
		List<ChatTextVo> test = chatTextDao.getChatTextList(chat_id);

		/***Then***/
		assertEquals(4, test.size());
	}
	
	@Test
	public void chatCntTest() {
		/***Given***/
		String mem_id = "brown";
		int cnt = 0;
		/***When***/
		List<ChatCollectionVo> test = chatTextDao.chatCntList(mem_id);
		for(int i = 0; i < test.size(); i ++) {
			cnt += test.get(i).getCnt();
		}

		/***Then***/
		assertEquals(15, cnt);
	}

}
