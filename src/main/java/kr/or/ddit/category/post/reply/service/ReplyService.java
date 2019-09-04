package kr.or.ddit.category.post.reply.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.category.post.reply.dao.IReplyDao;
import kr.or.ddit.category.post.reply.model.ReplyVo;

@Service
public class ReplyService implements IReplyService {
	@Resource(name = "replyDao")
	private IReplyDao replyDao;

	/**
	* Method : replyInsert
	* 작성자 : 정요한
	* 변경이력 :
	* @param replyVo
	* @return
	* Method 설명 : 댓글 등록
	*/
	@Override
	public int replyInsert(ReplyVo replyVo) {
		int replyCnt = replyDao.replyInsert(replyVo);
		return replyCnt;
	}

	/**
	* Method : replyList
	* 작성자 : 정요한
	* 변경이력 :
	* @param post_id
	* @return
	* Method 설명 : 댓글 리스트
	*/
	@Override
	public List<ReplyVo> replyList(int post_id) {
		List<ReplyVo> replyList = replyDao.replyList(post_id);
		return replyList;
	}

	/**
	* Method : replyDelete
	* 작성자 : 정요한
	* 변경이력 :
	* @param reply_id
	* @return
	* Method 설명 : 댓글 삭제
	*/
	@Override
	public int replyDelete(int reply_id) {
		return replyDao.replyDelete(reply_id);
	}

	/**
	* Method : replyModify
	* 작성자 : 정요한
	* 변경이력 :
	* @param rvo
	* @return
	* Method 설명 : 댓글 수정
	*/
	@Override
	public int replyModify(ReplyVo rvo) {
		return replyDao.replyModify(rvo);
	}

	/**
	* Method : getReply
	* 작성자 : 정요한
	* 변경이력 :
	* @param reply_id
	* @return
	* Method 설명 : 댓글 가져오기
	*/
	@Override
	public ReplyVo getReply(int reply_id) {
		return replyDao.getReply(reply_id);
	}

}
