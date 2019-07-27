package kr.or.ddit.category.post.attachment.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.category.post.attachment.model.AttachmentVo;
import kr.or.ddit.testenv.LogicTestEnv;

public class AttachmentDaoTest extends LogicTestEnv {

	@Resource(name = "attachmentDao")
	private IAttachmentDao attachmentDao;

	@Test
	public void getAttachmentDaoTest() {
		/*** Given ***/
		int att_id = 1;
		/*** When ***/
		AttachmentVo avo = attachmentDao.getAttachment(att_id);
		/*** Then ***/
		assertNotNull("attachmentDao");
		assertEquals(1, avo.getPost_id());
	}

	@Test
	public void attachmentInsertDaoTest() {
		/*** Given ***/
		AttachmentVo attachmentVo = new AttachmentVo();
		int post_id = 1;
		attachmentVo.setAtt_nm("a");
		attachmentVo.setAtt_path("a");
		attachmentVo.setPost_id(post_id);

		/*** When ***/
		attachmentDao.attachmentInsert(attachmentVo);
//		List<AttachmentVo> al = attachmentDao.getAttachmentList(post_id);
//		al = attachmentDao.getAttachmentList(post_id);

		/*** Then ***/
//		assertEquals(1, attachmentCnt);
	}

	@Test
	public void attachmentDeleteDaoTest() {
		/*** Given ***/
		int att_id = 1;

		/*** When ***/
		int deleteCnt = attachmentDao.attachmentDelete(att_id);

		/*** Then ***/
		assertEquals(1, deleteCnt);

	}

	@Test
	public void getAttachmentListDaoTest() {

		/*** Given ***/
		int post_id = 1;
		/*** When ***/
		List<AttachmentVo> avoList = attachmentDao.getAttachmentList(post_id);
		/*** Then ***/
		assertEquals(10, avoList.size());
	}

	@Test
	public void getAttachmentTest() {
		/*** Given ***/
		int att_id = 1;
		/*** When ***/
		AttachmentVo avo = attachmentDao.getAttachment(att_id);

		/*** Then ***/
		assertEquals("userPagingList1.txt", avo.getAtt_nm());
	}

}
