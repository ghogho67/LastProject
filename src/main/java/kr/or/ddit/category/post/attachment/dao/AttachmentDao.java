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

	/**
	* Method : attachmentInsert
	* 작성자 : PC01
	* 변경이력 :
	* @param attachmentVo
	* @return
	* Method 설명 : 첨부파일 저장
	*/
	@Override
	public int attachmentInsert(AttachmentVo attachmentVo) {
		logger.debug("☞attachmentVo:{}", attachmentVo);
		return sqlSession.insert("attachment.attachmentInsert", attachmentVo);
	}

	/**
	* Method : attachmentDelete
	* 작성자 : PC01
	* 변경이력 :
	* @param att_id
	* @return
	* Method 설명 : 첨부파일 삭제
	*/
	@Override
	public int attachmentDelete(int att_id) {
		return sqlSession.update("attachment.attachmentDelete", att_id);
	}

	/**
	* Method : getAttachmentList
	* 작성자 : PC01
	* 변경이력 :
	* @param post_id
	* @return
	* Method 설명 : 첨부파일 리스트 가져오기
	*/
	@Override
	public List<AttachmentVo> getAttachmentList(int post_id) {
		return sqlSession.selectList("attachment.getAttachmentList", post_id);
	}

	/**
	* Method : getAttachment
	* 작성자 : PC01
	* 변경이력 :
	* @param att_id
	* @return
	* Method 설명 : 첨부파일 가져오기
	*/
	@Override
	public AttachmentVo getAttachment(int att_id) {
		return sqlSession.selectOne("attachment.getAttachment", att_id);

	}

}
