package kr.or.ddit.category.post.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.or.ddit.category.post.model.PostVo;

@Repository
public class PostDao implements IPostDao {

	private static final Logger logger = LoggerFactory.getLogger(PostDao.class);

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	@Override
	public List<PostVo> postList(int cate_id) {
		return sqlSession.selectList("post.postList", cate_id);
	}

	@Override
	public int postInsert(PostVo postVo) {
		return sqlSession.insert("post.postInsert", postVo);
	}

	@Override
	public PostVo getPost(int post_id) {
		return sqlSession.selectOne("post.getPost", post_id);
	}

	@Override
	public int postModify(PostVo postVo) {

		return sqlSession.update("post.postModify", postVo);
	}

	@Override
	public int postDelete(int post_id) {
		return sqlSession.update("post.postDelete", post_id);
	}

	@Override
	public PostVo getLatestPost() {
		return sqlSession.selectOne("post.getLatestPost");
	}

	@Override
	public int updateStep(PostVo PostVo) {
		return sqlSession.update("post.updateStep", PostVo);

	}

	@Override
	public int postReply(PostVo PostVo) {
		return sqlSession.insert("post.postReply", PostVo);
	}

	@Override
	public List<PostVo> postPagingList(Map<String, Object> map) {
		logger.debug("whawt");
		logger.debug("map:{}", map);
		return sqlSession.selectList("post.postPagingList", map);
	}

	@Override
	public int postCnt(int cate_id) {
		return sqlSession.selectOne("post.postCnt", cate_id);
	}
}
