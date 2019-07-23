package kr.or.ddit.category.reply.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.category.reply.dao.IReplyDao;
import kr.or.ddit.category.reply.model.ReplyVo;

@Service
public class ReplyService implements IReplyService {
	@Resource(name = "replyDao")
	private IReplyDao replyDao;

	@Override
	public int replyInsert(ReplyVo replyVo) {
		int replyCnt = replyDao.replyInsert(replyVo);
		return replyCnt;
	}

	@Override
	public List<ReplyVo> replyList(int post_id) {
		List<ReplyVo> replyList = replyDao.replyList(post_id);
		return replyList;
	}

	@Override
	public int replyDelete(int reply_id) {
		return replyDao.replyDelete(reply_id);
	}

}
