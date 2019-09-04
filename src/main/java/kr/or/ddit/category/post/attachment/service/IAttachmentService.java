package kr.or.ddit.category.post.attachment.service;

import java.util.List;

import kr.or.ddit.category.post.attachment.model.AttachmentVo;

public interface IAttachmentService {

	/**
	* Method : getAttachmentList
	* 작성자 : 정요한
	* 변경이력 :
	* @param post_id
	* @return
	* Method 설명 : 첨부파일 리스트 가져오기
	*/
	List<AttachmentVo> getAttachmentList(int post_id);

	/**
	* Method : attachmentInsert
	* 작성자 : 정요한
	* 변경이력 :
	* @param attachmentVo
	* @return
	* Method 설명 : 첨부파일 저장
	*/
	int attachmentInsert(AttachmentVo attachmentVo);

	/**
	* Method : attchmentDelete
	* 작성자 : 정요한
	* 변경이력 :
	* @param attchment_id
	* @return
	* Method 설명 : 첨부파일 삭제
	*/
	int attchmentDelete(int attchment_id);

	/**
	* Method : getAttachment
	* 작성자 : 정요한
	* 변경이력 :
	* @param att_id
	* @return
	* Method 설명 : 첨부파일 가져오기
	*/
	AttachmentVo getAttachment(int att_id);

}
