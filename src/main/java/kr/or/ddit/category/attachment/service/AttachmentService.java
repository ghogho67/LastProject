package kr.or.ddit.category.attachment.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.category.attachment.dao.IAttachmentDao;

@Service
public class AttachmentService implements IAttachmentService{
	@Resource(name = "attachmentDao")
	private IAttachmentDao attachmentDao;
}
