package kr.or.ddit.reply.dao;

import static org.junit.Assert.assertEquals;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.category.reply.dao.IReplyDao;
import kr.or.ddit.category.reply.model.ReplyVo;
import kr.or.ddit.testenv.LogicTestEnv;

public class ReplyDaoTest extends LogicTestEnv {

	@Resource(name = "replyDao")
	private IReplyDao replyDao;

	@Test
	public void replyInsertDaoTest() {
		/*** Given ***/
		// 테이블 컬럼은 댓글 아이디, 게시글 아이디, 댓글 내용, 댓글 작성시간, 댓글 작성자로 구성되어 있다.
		// 댓글 작성시간은 xml에서 sysdate로 댓글 아이디는 sequence로 들어갈 수 있도록 설정한다.
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
	public void replyListTest() {

		/*** Given ***/
		int post_id = 8;
		/*** When ***/
		List<ReplyVo> replyList = replyDao.replyList(post_id);
		/*** Then ***/
		assertEquals(3, replyList.size());
	}

	@Test
	public void replyDeleteTest() {

		/*** Given ***/
		int reply_id = 1;
		/*** When ***/
		int deleteCnt = replyDao.replyDelete(reply_id);
		/*** Then ***/
		assertEquals(1, deleteCnt);

	}
}
