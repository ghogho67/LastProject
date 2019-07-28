package kr.or.ddit.category.post.attachment.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.category.post.attachment.dao.IAttachmentDao;
import kr.or.ddit.category.post.attachment.model.AttachmentVo;

@Service
public class AttachmentService implements IAttachmentService {
	@Resource(name = "attachmentDao")
	private IAttachmentDao attachmentDao;

	@Override
	public List<AttachmentVo> getAttachmentList(int post_id) {
		return attachmentDao.getAttachmentList(post_id);
	}

	@Override
	public int attachmentInsert(AttachmentVo attachmentVo) {
		return attachmentDao.attachmentInsert(attachmentVo);
	}

	@Override
	public int attchmentDelete(int att_id) {
		return attachmentDao.attachmentDelete(att_id);
	}

	@Override
	public AttachmentVo getAttachment(int att_id) {
		return attachmentDao.getAttachment(att_id);
	}
}
