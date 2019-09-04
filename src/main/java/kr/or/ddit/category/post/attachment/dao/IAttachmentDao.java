package kr.or.ddit.category.post.attachment.dao;

import java.util.List;

import kr.or.ddit.category.post.attachment.model.AttachmentVo;

public interface IAttachmentDao {

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
	* Method : attachmentDelete
	* 작성자 : 정요한
	* 변경이력 :
	* @param att_id
	* @return
	* Method 설명 : 첨부파일 삭제
	*/
	int attachmentDelete(int att_id);

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
	* Method : getAttachment
	* 작성자 : 정요한
	* 변경이력 :
	* @param att_id
	* @return
	* Method 설명 : 첨부파일 가져오기
	*/
	AttachmentVo getAttachment(int att_id);

}
