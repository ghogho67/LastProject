package kr.or.ddit.category.post.post.service;

import static org.junit.Assert.assertEquals;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.category.post.post.model.PostVo;
import kr.or.ddit.page.model.PageVo;
import kr.or.ddit.testenv.LogicTestEnv;

public class PostServiceTest extends LogicTestEnv {
	private static final Logger logger = LoggerFactory.getLogger(PostServiceTest.class);

	@Resource(name = "postService")
	private IPostService postService;

	@Test
	public void postListServiceTest() {
		/*** Given ***/
		int cate_id = 1;

		/*** When ***/
		List<PostVo> pl = postService.postList(cate_id);

		/*** Then ***/
		assertEquals(11, pl.size());
	}

	@Test
	public void postInsertServiceTest() {
		/*** Given ***/
		PostVo pvo = new PostVo();
		pvo.setPost_nm("sdf");
		pvo.setPost_cont("sdfsdf");
		pvo.setCate_id(1);
		pvo.setMem_id("brown");

		/*** When ***/
		int cnt = postService.postInsert(pvo);
		logger.debug("cnt:{}", cnt);

		/*** Then ***/
		assertEquals(1, cnt);
	}

	@Test
	public void getPostServiceTest() {
		/*** Given ***/
		int post_id = 1;

		/*** When ***/
		PostVo pvo = postService.getPost(post_id);

		/*** Then ***/
		assertEquals("게시글1", pvo.getPost_nm());
	}

	@Test
	public void postModifyServiceTest() {
		/*** Given ***/
		PostVo pvo = new PostVo();
		pvo.setPost_nm("sdf");
		pvo.setPost_cont("sdfsdf");
		pvo.setPost_id(8);

		/*** When ***/
		int cnt = postService.postModify(pvo);
		/*** Then ***/
		assertEquals(1, cnt);
	}

	@Test
	public void postDeleteServiceTest() {
		/*** Given ***/
		int post_id = 1;

		/*** When ***/
		postService.postDelete(post_id);

		/*** Then ***/
		logger.debug(postService.getPost(1).getPost_del());
		assertEquals("Y", postService.getPost(1).getPost_del());
	}

	@Test
	public void getLatestPostServiceTest() {
		/*** Given ***/

		/*** When ***/
		PostVo pvo = postService.getLatestPost();
		/*** Then ***/
		assertEquals(12, pvo.getPost_id());
	}

//	@Test
//	public void updateStepServiceTest() {
//		PostVo postVo = postService.getPost(150);
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
//		postService.updateStep(postVo);
//		postVo = postService.getPost(150);
//		assertEquals(2, postVo.getRe_step());
//	}

	@Test
	public void postReplyServiceTest() {
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
		int insertCnt = postService.postReply(postVo);

		/*** Then ***/
		assertEquals(1, insertCnt);
	}

	@Test
	public void postPagingListServiceTest() {
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
		map = postService.postPagingList(map);
		/*** Then ***/
		logger.debug("map:{}", map.size());
	}

	@Test
	public void postCntServiceTest() {
		/*** Given ***/
		int cate_id = 1;

		/*** When ***/
		int cnt = postService.postCnt(cate_id);

		/*** Then ***/
		assertEquals(10, cnt);
	}

}
