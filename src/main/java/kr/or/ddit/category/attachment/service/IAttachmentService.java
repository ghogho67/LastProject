package kr.or.ddit.category.attachment.service;

import java.util.List;

import kr.or.ddit.category.attachment.model.AttachmentVo;

public interface IAttachmentService {

	List<AttachmentVo> getAttachmentList(int post_id);

	int attachmentInsert(AttachmentVo attachmentVo);

	int attchmentDelete(int attchment_id);

	AttachmentVo getAttachment(int attachment_id);

}
