package kr.or.ddit.category.post.post.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.ddit.category.post.post.dao.IPostDao;
import kr.or.ddit.category.post.post.model.PostVo;

@Service
public class PostService implements IPostService {
	private static final Logger logger = LoggerFactory.getLogger(PostService.class);
	@Resource(name = "postDao")
	private IPostDao postDao;

	/**
	* Method : postList
	* 작성자 : 정요한
	* 변경이력 :
	* @param cate_id
	* @return
	* Method 설명 : 게시글 리스트
	*/
	@Override
	public List<PostVo> postList(int cate_id) {
		List<PostVo> postList = postDao.postList(cate_id);
		return postList;
	}

	/**
	* Method : postInsert
	* 작성자 : 정요한
	* 변경이력 :
	* @param postVo
	* @return
	* Method 설명 : 게시글 등록
	*/
	@Override
	public int postInsert(PostVo postVo) {
		return postDao.postInsert(postVo);
	}

	/**
	* Method : getPost
	* 작성자 : 정요한
	* 변경이력 :
	* @param post_id
	* @return
	* Method 설명 : 게시글 갯수
	*/
	@Override
	public PostVo getPost(int post_id) {
		return postDao.getPost(post_id);
	}

	/**
	* Method : postDelete
	* 작성자 : 정요한
	* 변경이력 :
	* @param post_id
	* @return
	* Method 설명 : 게시글 삭제
	*/
	@Override
	public int postDelete(int post_id) {
		return postDao.postDelete(post_id);
	}

	/**
	* Method : getLatestPost
	* 작성자 : 정요한
	* 변경이력 :
	* @return
	* Method 설명 : 최근 게시글
	*/
	@Override
	public PostVo getLatestPost() {
		return postDao.getLatestPost();
	}

	/**
	* Method : postPagingList
	* 작성자 : 정요한
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 게시글 페이징 리스트
	*/
	@Override
	public Map<String, Object> postPagingList(Map<String, Object> map) {
		logger.debug("☞map:{}", map);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<PostVo> postList = postDao.postPagingList(map);
		resultMap.put("postList", postList);
		int postCnt = (int) map.get("cate_id");
		postCnt = postDao.postCnt((int) map.get("cate_id"));
		resultMap.put("postCnt", postCnt);
		int pageSize = (int) map.get("pageSize");
		int paginationSize = (int) Math.ceil((double) postCnt / pageSize);
		resultMap.put("paginationSize", paginationSize);
		return resultMap;
	}

	/**
	* Method : postCnt
	* 작성자 : 정요한
	* 변경이력 :
	* @param cate_id
	* @return
	* Method 설명 : 게시글 갯수
	*/
	@Override
	public int postCnt(int cate_id) {
		return postDao.postCnt(cate_id);
	}

	/**
	* Method : postModify
	* 작성자 : 정요한
	* 변경이력 :
	* @param postVo
	* @return
	* Method 설명 : 게시글 수정
	*/
	@Override
	public int postModify(PostVo postVo) {
		return postDao.postModify(postVo);
	}

	@Override
	public int updateStep(PostVo postVo) {
		return postDao.updateStep(postVo);
	}

	/**
	* Method : postReply
	* 작성자 : 정요한
	* 변경이력 :
	* @param postVo
	* @return
	* Method 설명 : 게시글 답글
	*/
	@Override
	public int postReply(PostVo postVo) {
		return postDao.postReply(postVo);
	}

	/**
	* Method : titlePagingList
	* 작성자 : 정요한
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 제목 검색 페이징
	*/
	@Override
	public Map<String, Object> titlePagingList(Map<String, Object> map) {

		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<PostVo> postList = postDao.titlePagingList(map);
		resultMap.put("postList", postList);
		int postCnt = (int) map.get("cate_id");
		postCnt = postDao.titlePostCnt(map);
		resultMap.put("postCnt", postCnt);
		int pageSize = (int) map.get("pageSize");
		int paginationSize = (int) Math.ceil((double) postCnt / pageSize);
		resultMap.put("paginationSize", paginationSize);

		return resultMap;
	}

	/**
	* Method : idPagingList
	* 작성자 : 정요한
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 아이디 검색 페이징
	*/
	@Override
	public Map<String, Object> idPagingList(Map<String, Object> map) {

		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<PostVo> postList = postDao.idPagingList(map);
		resultMap.put("postList", postList);
		int postCnt = (int) map.get("cate_id");
		postCnt = postDao.idPostCnt(map);
		resultMap.put("postCnt", postCnt);
		int pageSize = (int) map.get("pageSize");
		int paginationSize = (int) Math.ceil((double) postCnt / pageSize);
		resultMap.put("paginationSize", paginationSize);

		return resultMap;
	}

	/**
	* Method : contPagingList
	* 작성자 : 정요한
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 내용 검색 페이징
	*/
	@Override
	public Map<String, Object> contPagingList(Map<String, Object> map) {

		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<PostVo> postList = postDao.contPagingList(map);
		resultMap.put("postList", postList);
		int postCnt = (int) map.get("cate_id");
		postCnt = postDao.contPostCnt(map);
		resultMap.put("postCnt", postCnt);
		int pageSize = (int) map.get("pageSize");
		int paginationSize = (int) Math.ceil((double) postCnt / pageSize);
		resultMap.put("paginationSize", paginationSize);

		return resultMap;
	}
}
