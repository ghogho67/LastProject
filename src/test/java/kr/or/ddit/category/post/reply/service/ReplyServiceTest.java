package kr.or.ddit.category.post.reply.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.category.post.reply.model.ReplyVo;
import kr.or.ddit.testenv.LogicTestEnv;

public class ReplyServiceTest extends LogicTestEnv {

	@Resource(name = "replyService")
	private IReplyService replyService;

	@Test
	public void replyInsertServiceTest() {
		/*** Given ***/
		ReplyVo rvo = new ReplyVo();
		rvo.setPost_id(1);
		rvo.setReply_cont("a");
		rvo.setMem_id("brown");
		rvo.setPost_id(1);

		/*** When ***/
		int replyCnt = replyService.replyInsert(rvo);

		/*** Then ***/
		assertEquals(1, replyCnt);
	}

	@Test
	public void replyListServiceTest() {

		/*** Given ***/
		int post_id = 8;
		/*** When ***/
		List<ReplyVo> replyList = replyService.replyList(post_id);
		/*** Then ***/
		assertEquals(1, replyList.size());
	}

	@Test
	public void replyDeleteServiceTest() {
		/*** Given ***/
		int reply_id = 1;
		/*** When ***/
		int deleteCnt = replyService.replyDelete(reply_id);
		/*** Then ***/
		assertEquals(1, deleteCnt);

	}

	@Test
	public void replyModifyServiceTest() {
		/*** Given ***/
		ReplyVo rvo = new ReplyVo();
		rvo.setReply_id(1);
		rvo.setReply_cont("a");

		/*** When ***/
		int updateCnt = replyService.replyModify(rvo);
		/*** Then ***/
		assertEquals(1, updateCnt);
	}

	@Test
	public void getReplyServiceTest() {
		/*** Given ***/
		int reply_id = 1;
		/*** When ***/
		ReplyVo rvo = replyService.getReply(reply_id);

		/*** Then ***/
		assertNotNull(rvo);
		assertEquals(1, rvo.getPost_id());
	}

}
