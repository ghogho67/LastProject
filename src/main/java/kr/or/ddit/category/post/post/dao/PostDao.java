package kr.or.ddit.category.post.post.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.or.ddit.category.post.post.model.PostVo;

@Repository
public class PostDao implements IPostDao {

	private static final Logger logger = LoggerFactory.getLogger(PostDao.class);

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	/**
	* Method : postList
	* 작성자 : 정요한
	* 변경이력 :
	* @param cate_id
	* @return
	* Method 설명 : 게시글 페이징
	*/ 
	@Override
	public List<PostVo> postList(int cate_id) {
		return sqlSession.selectList("post.postList", cate_id);
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
		return sqlSession.insert("post.postInsert", postVo);
	}

	/**
	* Method : getPost
	* 작성자 : 정요한
	* 변경이력 :
	* @param post_id
	* @return
	* Method 설명 : 게시글 가져오기
	*/
	@Override
	public PostVo getPost(int post_id) {
		return sqlSession.selectOne("post.getPost", post_id);
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

		return sqlSession.update("post.postModify", postVo);
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
		return sqlSession.update("post.postDelete", post_id);
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
		return sqlSession.selectOne("post.getLatestPost");
	}

	@Override
	public int updateStep(PostVo PostVo) {
		return sqlSession.update("post.updateStep", PostVo);

	}

	/**
	* Method : postReply
	* 작성자 : 정요한
	* 변경이력 :
	* @param PostVo
	* @return
	* Method 설명 : 답글 등록
	*/
	@Override
	public int postReply(PostVo PostVo) {
		return sqlSession.insert("post.postReply", PostVo);
	}

	/**
	* Method : postPagingList
	* 작성자 : 정요한
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 게시글 페이징
	*/
	@Override
	public List<PostVo> postPagingList(Map<String, Object> map) {
		return sqlSession.selectList("post.postPagingList", map);
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
		return sqlSession.selectOne("post.postCnt", cate_id);
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
	public List<PostVo> titlePagingList(Map<String, Object> map) {
		return sqlSession.selectList("post.titlePagingList", map);
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
	public List<PostVo> idPagingList(Map<String, Object> map) {
		return sqlSession.selectList("post.idPagingList", map);
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
	public List<PostVo> contPagingList(Map<String, Object> map) {
		return sqlSession.selectList("post.contPagingList", map);
	}

	/**
	* Method : titlePostCnt
	* 작성자 : 정요한
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 제목 검색 페이징
	*/
	@Override
	public int titlePostCnt(Map<String, Object> map) {
		return sqlSession.selectOne("post.titlePostCnt", map);
	}

	/**
	* Method : idPostCnt
	* 작성자 : 정요한
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 아이디 검색 갯수
	*/
	@Override
	public int idPostCnt(Map<String, Object> map) {
		return sqlSession.selectOne("post.idPostCnt", map);
	}

	/**
	* Method : contPostCnt
	* 작성자 : 정요한
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 내용 검색 갯수
	*/
	@Override
	public int contPostCnt(Map<String, Object> map) {
		return sqlSession.selectOne("post.contPostCnt", map);
	}

}
