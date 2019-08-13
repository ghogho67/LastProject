package kr.or.ddit.chat.chatText.service;

import static org.junit.Assert.assertEquals;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.chat.chatText.model.ChatTextVo;
import kr.or.ddit.testenv.LogicTestEnv;

public class ChatTextServiceTest extends LogicTestEnv{

	@Resource(name = "chatTextService")
	private IChatTextService chatTextService;
	@Test
	public void insertChatTextTest() {
		/***Given***/
		int chat_id = 1;
		String mem_id = "brown";
		String chattext_cont = "넵";
		
		ChatTextVo chatTextVo = new ChatTextVo(chat_id,mem_id,chattext_cont);
		

		/***When***/
		int test = chatTextService.insertChatText(chatTextVo);

		/***Then***/
		assertEquals(1, test);
	}
	
	@Test
	public void getChatTextListTest() {
		/***Given***/
		int chat_id = 1;
		
		/***When***/
		List<ChatTextVo> test = chatTextService.getChatTextList(chat_id);

		/***Then***/
		assertEquals(4, test.size());
	}


}
