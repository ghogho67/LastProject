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

	/**
	* Method : getAttachmentList
	* 작성자 : 정요한
	* 변경이력 :
	* @param post_id
	* @return
	* Method 설명 : 첨부파일 리스트 가져오기
	*/
	@Override
	public List<AttachmentVo> getAttachmentList(int post_id) {
		return attachmentDao.getAttachmentList(post_id);
	}

	/**
	* Method : attachmentInsert
	* 작성자 : 정요한
	* 변경이력 :
	* @param attachmentVo
	* @return
	* Method 설명 : 첨부파일 저장
	*/
	@Override
	public int attachmentInsert(AttachmentVo attachmentVo) {
		return attachmentDao.attachmentInsert(attachmentVo);
	}

	/**
	* Method : attchmentDelete
	* 작성자 : 정요한
	* 변경이력 :
	* @param att_id
	* @return
	* Method 설명 : 첨부파일 삭제
	*/
	@Override
	public int attchmentDelete(int att_id) {
		return attachmentDao.attachmentDelete(att_id);
	}

	/**
	* Method : getAttachment
	* 작성자 : 정요한
	* 변경이력 :
	* @param att_id
	* @return
	* Method 설명 : 첨부파일 가져오기
	*/
	@Override
	public AttachmentVo getAttachment(int att_id) {
		return attachmentDao.getAttachment(att_id);
	}
}
