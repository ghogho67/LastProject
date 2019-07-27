package kr.or.ddit.category.post.attachment.dao;

import java.util.List;

import kr.or.ddit.category.post.attachment.model.AttachmentVo;

public interface IAttachmentDao {

	int attachmentInsert(AttachmentVo attachmentVo);

	int attachmentDelete(int att_id);

	List<AttachmentVo> getAttachmentList(int post_id);

	AttachmentVo getAttachment(int att_id);

}
