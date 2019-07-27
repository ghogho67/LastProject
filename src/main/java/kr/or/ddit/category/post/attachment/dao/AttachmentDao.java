package kr.or.ddit.category.post.attachment.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.or.ddit.category.post.attachment.model.AttachmentVo;

@Repository
public class AttachmentDao implements IAttachmentDao {
	private static final Logger logger = LoggerFactory.getLogger(AttachmentDao.class);

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	@Override
	public int attachmentInsert(AttachmentVo attachmentVo) {
		logger.debug("☞attachmentVo:{}", attachmentVo);
		return sqlSession.insert("attachment.attachmentInsert", attachmentVo);
	}

	@Override
	public int attachmentDelete(int att_id) {
		return sqlSession.update("attachment.attachmentDelete", att_id);
	}

	@Override
	public List<AttachmentVo> getAttachmentList(int post_id) {
		return sqlSession.selectList("attachment.getAttachmentList", post_id);
	}

	@Override
	public AttachmentVo getAttachment(int att_id) {
		return sqlSession.selectOne("attachment.getAttachment", att_id);

	}

}
