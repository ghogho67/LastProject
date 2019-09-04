package kr.or.ddit.category.post.reply.service;

import java.util.List;

import kr.or.ddit.category.post.reply.model.ReplyVo;

public interface IReplyService {

	/**
	* Method : replyInsert
	* 작성자 : 정요한
	* 변경이력 :
	* @param replyVo
	* @return
	* Method 설명 : 댓글 등록
	*/
	int replyInsert(ReplyVo replyVo);

	/**
	* Method : replyList
	* 작성자 : 정요한
	* 변경이력 :
	* @param post_id
	* @return
	* Method 설명 : 댓글 리스트
	*/
	List<ReplyVo> replyList(int post_id);

	/**
	* Method : replyDelete
	* 작성자 : 정요한
	* 변경이력 :
	* @param reply_id
	* @return
	* Method 설명 : 댓글 삭제
	*/
	int replyDelete(int reply_id);

	/**
	* Method : replyModify
	* 작성자 : 정요한
	* 변경이력 :
	* @param rvo
	* @return
	* Method 설명 : 댓글 수정
	*/
	int replyModify(ReplyVo rvo);

	/**
	* Method : getReply
	* 작성자 : 정요한
	* 변경이력 :
	* @param reply_id
	* @return
	* Method 설명 : 댓글 가져오기
	*/
	ReplyVo getReply(int reply_id);

}
