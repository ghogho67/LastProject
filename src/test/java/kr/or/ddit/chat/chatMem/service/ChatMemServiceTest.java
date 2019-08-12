package kr.or.ddit.chat.chatMem.service;

import static org.junit.Assert.assertEquals;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.chat.chatMem.model.ChatMemVo;
import kr.or.ddit.testenv.LogicTestEnv;

public class ChatMemServiceTest extends LogicTestEnv{

	@Resource(name = "chatMemService")
	private IChatMemService chatMemService;
	
	@Test
	public void chatMemListTest() {
		/***Given***/
		String mem_id = "aha";
		/***When***/
		List<ChatMemVo>chatMemList = chatMemService.chatMemList(mem_id);
		/***Then***/
		assertEquals(2, chatMemList.size());
	}

}
