package kr.or.ddit.category.post.reply.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.category.post.reply.model.ReplyVo;
import kr.or.ddit.testenv.LogicTestEnv;

public class ReplyDaoTest extends LogicTestEnv {

	@Resource(name = "replyDao")
	private IReplyDao replyDao;

	@Test
	public void replyInsertDaoTest() {
		/*** Given ***/
		ReplyVo rvo = new ReplyVo();
		rvo.setPost_id(1);
		rvo.setReply_cont("a");
		rvo.setMem_id("brown");
		rvo.setPost_id(1);

		/*** When ***/
		int replyCnt = replyDao.replyInsert(rvo);

		/*** Then ***/
		assertEquals(1, replyCnt);
	}

	@Test
	public void replyListDaoTest() {

		/*** Given ***/
		int post_id = 8;
		/*** When ***/
		List<ReplyVo> replyList = replyDao.replyList(post_id);
		/*** Then ***/
		assertEquals(1, replyList.size());
	}

	@Test
	public void replyDeleteDaoTest() {
		/*** Given ***/
		int reply_id = 1;
		/*** When ***/
		int deleteCnt = replyDao.replyDelete(reply_id);
		/*** Then ***/
		assertEquals(1, deleteCnt);

	}

	@Test
	public void replyModifyDaoTest() {
		/*** Given ***/
		ReplyVo rvo = new ReplyVo();
		rvo.setReply_id(1);
		rvo.setReply_cont("a");

		/*** When ***/
		int updateCnt = replyDao.replyModify(rvo);
		/*** Then ***/
		assertEquals(1, updateCnt);
	}

	@Test
	public void getReplyDaoTest() {
		/*** Given ***/
		int reply_id = 1;
		/*** When ***/
		ReplyVo rvo = replyDao.getReply(reply_id);

		/*** Then ***/
		assertNotNull(rvo);
		assertEquals(1, rvo.getPost_id());
	}

}
