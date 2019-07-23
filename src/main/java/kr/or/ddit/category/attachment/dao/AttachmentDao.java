package kr.or.ddit.category.attachment.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.category.attachment.model.AttachmentVo;

@Repository
public class AttachmentDao implements IAttachmentDao {

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	@Override
	public int attachmentInsert(AttachmentVo attachmentVo) {
		return sqlSession.insert("attachment.attachmentInsert", attachmentVo);
	}

	@Override
	public int attachmentDelete(int attachment_id) {

		return sqlSession.update("attachment.attachmentDelete", attachment_id);
	}

	@Override
	public List<AttachmentVo> getAttachmentList(int post_id) {
		return sqlSession.selectList("attachment.getAttachmentList", post_id);
	}

	@Override
	public AttachmentVo getAttachment(int attachment_id) {
		return sqlSession.selectOne("attachment.getAttachment", attachment_id);

	}

}
