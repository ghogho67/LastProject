package kr.or.ddit.category.reply.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.category.reply.model.ReplyVo;

@Repository
public class ReplyDao implements IReplyDao {
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	@Override
	public int replyInsert(ReplyVo replyVo) {
		return sqlSession.insert("reply.replyInsert", replyVo);
	}

	@Override
	public List<ReplyVo> replyList(int post_id) {
		return sqlSession.selectList("reply.replyList", post_id);
	}

	@Override
	public int replyDelete(int reply_id) {
		return sqlSession.update("reply.replyDelete", reply_id);
	}

}
