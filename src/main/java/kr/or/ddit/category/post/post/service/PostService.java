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

	@Override
	public List<PostVo> postList(int cate_id) {
		List<PostVo> postList = postDao.postList(cate_id);
		return postList;
	}

	@Override
	public int postInsert(PostVo postVo) {
		return postDao.postInsert(postVo);
	}

	@Override
	public PostVo getPost(int post_id) {
		return postDao.getPost(post_id);
	}

	@Override
	public int postDelete(int post_id) {
		return postDao.postDelete(post_id);
	}

	@Override
	public PostVo getLatestPost() {
		return postDao.getLatestPost();
	}

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

	@Override
	public int postCnt(int cate_id) {
		return postDao.postCnt(cate_id);
	}

	@Override
	public int postModify(PostVo postVo) {
		return postDao.postModify(postVo);
	}

	@Override
	public int updateStep(PostVo postVo) {
		return postDao.updateStep(postVo);
	}

	@Override
	public int postReply(PostVo postVo) {
		return postDao.postReply(postVo);
	}

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
