package kr.or.ddit.category.post.dao;

import static org.junit.Assert.assertEquals;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.category.post.model.PostVo;
import kr.or.ddit.page.model.PageVo;
import kr.or.ddit.testenv.LogicTestEnv;

public class PostDaoTest extends LogicTestEnv {
	private static final Logger logger = LoggerFactory.getLogger(PostDaoTest.class);

	@Resource(name = "postDao")
	private IPostDao postDao;

	@Test
	public void postListDaoTest() {
		/*** Given ***/
		int cate_id = 1;

		/*** When ***/
		List<PostVo> pl = postDao.postList(cate_id);

		/*** Then ***/
		assertEquals(11, pl.size());
	}

	@Test
	public void postInsertDaoTest() {
		/*** Given ***/
		PostVo pvo = new PostVo();
		pvo.setPost_nm("sdf");
		pvo.setPost_cont("sdfsdf");
		pvo.setCate_id(1);
		pvo.setMem_id("brown");

		/*** When ***/
		int cnt = postDao.postInsert(pvo);
		logger.debug("cnt:{}", cnt);

		/*** Then ***/
		assertEquals(1, cnt);
	}

	@Test
	public void getPostDaoTest() {
		/*** Given ***/
		int post_id = 1;

		/*** When ***/
		PostVo pvo = postDao.getPost(post_id);

		/*** Then ***/
		assertEquals("게시글1", pvo.getPost_nm());
	}

	@Test
	public void postModifyDaoTest() {
		/*** Given ***/
		PostVo pvo = new PostVo();
		pvo.setPost_nm("sdf");
		pvo.setPost_cont("sdfsdf");
		pvo.setPost_id(8);

		/*** When ***/
		int cnt = postDao.postModify(pvo);
		/*** Then ***/
		assertEquals(1, cnt);
	}

	@Test
	public void postDeleteDaoTest() {
		/*** Given ***/
		int post_id = 1;

		/*** When ***/
		postDao.postDelete(post_id);

		/*** Then ***/
		logger.debug(postDao.getPost(1).getPost_del());
		assertEquals("Y", postDao.getPost(1).getPost_del());
	}

	@Test
	public void getLatestPostDaoTest() {
		/*** Given ***/

		/*** When ***/
		PostVo pvo = postDao.getLatestPost();
		/*** Then ***/
		assertEquals(12, pvo.getPost_id());
	}

//	@Test
//	public void updateStepDaoTest() {
//		PostVo postVo = postDao.getPost(150);
//		postVo.setPost_nm("post_title");
//		postVo.setPost_cont("post_content");
//		postVo.setCate_id(1);
//		postVo.setMem_id("brown");
//		postVo.setRef(postVo.getRef());
//		postVo.setRe_step(postVo.getRe_step() + 1);
//		postVo.setRe_level(postVo.getRe_level() + 1);
//
//		// 답글 순서조정 메서드
//		logger.debug("re_steP:{}", postVo.getRe_step());
//		postDao.updateStep(postVo);
//		postVo = postDao.getPost(150);
//		assertEquals(2, postVo.getRe_step());
//	}

	@Test
	public void postReplyDaoTest() {
		/*** Given ***/
		/*** Given ***/
		PostVo postVo = new PostVo();
		postVo.setPost_nm("post_title");
		postVo.setPost_cont("post_content");
		postVo.setPost_group(1);
		postVo.setMem_id("brown");
		postVo.setCate_id(1);
		postVo.setPost_par(1);
//		postVo.setRef(1);
//		postVo.setRe_step(1);
//		postVo.setRe_level(1);
		/*** When ***/
		/*** Then ***/
		/*** When ***/
		int insertCnt = postDao.postReply(postVo);

		/*** Then ***/
		assertEquals(1, insertCnt);
	}

	@Test
	public void postPagingListDaoTest() {
		/*** Given ***/
		PageVo pageVo = new PageVo(1, 10);
		int page = pageVo.getPage();
		int pageSize = pageVo.getPageSize();
		int cate_id = 1;
		Map<String, Object> map = new HashMap<>();
		map.put("page", page);
		map.put("pageSize", pageSize);
		map.put("cate_id", cate_id);
		/*** When ***/
		List<PostVo> postList = postDao.postPagingList(map);
		/*** Then ***/
		logger.debug("postList.size:{}", postList.size());
		assertEquals(10, postList.size());
	}

	@Test
	public void postCntDaoTest() {
		/*** Given ***/
		int cate_id = 1;

		/*** When ***/
		int cnt = postDao.postCnt(cate_id);

		/*** Then ***/
		assertEquals(10, cnt);
	}
}
