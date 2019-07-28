package kr.or.ddit.category.post.post.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.category.post.post.model.PostVo;

public interface IPostDao {

	List<PostVo> postList(int cate_id);

	int postInsert(PostVo postVo);

	int postModify(PostVo pvo);

	int postDelete(int post_id);

	PostVo getLatestPost();

	int updateStep(PostVo PostVo);

	int postReply(PostVo PostVo);

	List<PostVo> postPagingList(Map<String, Object> map);

	PostVo getPost(int post_id);

	int postCnt(int cate_id);

}
