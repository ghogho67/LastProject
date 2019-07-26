package kr.or.ddit.category.reply.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.or.ddit.category.reply.model.ReplyVo;

@Repository
public class ReplyDao implements IReplyDao {
	private static final Logger logger = LoggerFactory.getLogger(ReplyDao.class);
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	@Override
	public int replyInsert(ReplyVo replyVo) {
		return sqlSession.insert("reply.insert", replyVo);
	}

	@Override
	public List<ReplyVo> replyList(int post_id) {
		return sqlSession.selectList("reply.replyList", post_id);
	}

	@Override
	public int replyDelete(int reply_id) {
		return sqlSession.update("reply.delete", reply_id);
	}

	@Override
	public int replyModify(ReplyVo rvo) {
		return sqlSession.update("reply.modify", rvo);
	}

	@Override
	public ReplyVo getReply(int reply_id) {
		return sqlSession.selectOne("reply.getReply", reply_id);
	}

}
