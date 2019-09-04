package kr.or.ddit.category.post.reply.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.or.ddit.category.post.reply.model.ReplyVo;

@Repository
public class ReplyDao implements IReplyDao {
	private static final Logger logger = LoggerFactory.getLogger(ReplyDao.class);
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

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
		return sqlSession.insert("reply.insert", replyVo);
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
		return sqlSession.selectList("reply.replyList", post_id);
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
		return sqlSession.update("reply.delete", reply_id);
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
		return sqlSession.update("reply.modify", rvo);
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
		return sqlSession.selectOne("reply.getReply", reply_id);
	}

}
