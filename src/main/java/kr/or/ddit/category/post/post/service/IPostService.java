package kr.or.ddit.category.post.post.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.category.post.post.model.PostVo;

public interface IPostService {
	List<PostVo> postList(int cate_id);

	int postInsert(PostVo postVo);

	PostVo getPost(int post_id);

	int postDelete(int post_id);

	PostVo getLatestPost();

	Map<String, Object> postPagingList(Map<String, Object> map);

	int postCnt(int cate_id);

	int postModify(PostVo postVo);

	int updateStep(PostVo postVo);

	int postReply(PostVo postVo);

	Map<String, Object> titlePagingList(Map<String, Object> map);

	Map<String, Object> idPagingList(Map<String, Object> map);

	Map<String, Object> contPagingList(Map<String, Object> map);
}
