package kr.or.ddit.category.post.post.dao;

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

public class PostDaoTest extends LogicTestEnv {
	private static final Logger logger = LoggerFactory.getLogger(PostDaoTest.class);

	@Resource(name = "postDao")
	private IPostDao postDao;

	/**
	* Method : postListDaoTest
	* 작성자 : 정요한
	* 변경이력 :
	* Method 설명 : 게시글 리스트 가져오기
	*/
	
	@Test
	public void postListDaoTest() {
		/*** Given ***/
		int cate_id = 1;
		/*** When ***/
		List<PostVo> pl = postDao.postList(cate_id);
		/*** Then ***/
		assertEquals(11, pl.size());
	}

	/**
	* Method : postInsertDaoTest
	* 작성자 : 정요한
	* 변경이력 :
	* Method 설명 : 게시글 등록
	*/
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

	/**
	* Method : getPostDaoTest
	* 작성자 : 정요한
	* 변경이력 :
	* Method 설명 : 게시글 가져오기
	*/
	@Test
	public void getPostDaoTest() {
		/*** Given ***/
		int post_id = 1;
		/*** When ***/
		PostVo pvo = postDao.getPost(post_id);
		/*** Then ***/
		assertEquals("게시글1", pvo.getPost_nm());
	}

	/**
	* Method : postModifyDaoTest
	* 작성자 : 정요한
	* 변경이력 : 
	* Method 설명 : 게시글 수정
	*/
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

	/**
	* Method : postDeleteDaoTest
	* 작성자 : 정요한
	* 변경이력 :
	* Method 설명 : 게시글 삭제
	*/
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

	/**
	* Method : getLatestPostDaoTest
	* 작성자 : 정요한
	* 변경이력 :
	* Method 설명 : 최신 게시글 가져오기
	*/
	@Test
	public void getLatestPostDaoTest() {
		/*** Given ***/

		/*** When ***/
		PostVo pvo = postDao.getLatestPost();
		/*** Then ***/
		assertEquals(12, pvo.getPost_id());
	}

	/**
	* Method : postReplyDaoTest
	* 작성자 : 정요한
	* 변경이력 :
	* Method 설명 : 답글 등록
	*/
	@Test
	public void postReplyDaoTest() {
		/*** Given ***/
		PostVo postVo = new PostVo();
		postVo.setPost_nm("post_title");
		postVo.setPost_cont("post_content");
		postVo.setPost_group(1);
		postVo.setMem_id("brown");
		postVo.setCate_id(1);
		postVo.setPost_par(1);
		/*** When ***/
		int insertCnt = postDao.postReply(postVo);

		/*** Then ***/
		assertEquals(1, insertCnt);
	}

	/**
	* Method : postPagingListDaoTest
	* 작성자 : 정요한
	* 변경이력 :
	* Method 설명 : 게시글 페이징 리스트
	*/
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

	/**
	* Method : postCntDaoTest
	* 작성자 : 정요한
	* 변경이력 :
	* Method 설명 : 게시글 갯수
	*/
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
