package kr.or.ddit.category.reply.service;

import java.util.List;

import kr.or.ddit.category.reply.model.ReplyVo;

public interface IReplyService {

	int replyInsert(ReplyVo replyVo);

	List<ReplyVo> replyList(int post_id);

	int replyDelete(int reply_id);

	int replyModify(ReplyVo rvo);

	ReplyVo getReply(int reply_id);

}
