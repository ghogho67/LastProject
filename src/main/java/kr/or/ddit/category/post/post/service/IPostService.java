package kr.or.ddit.category.post.post.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.category.post.post.model.PostVo;

public interface IPostService {
	
	/**
	* Method : postList
	* 작성자 : 정요한
	* 변경이력 :
	* @param cate_id
	* @return
	* Method 설명 : 게시글 리스트
	*/
	List<PostVo> postList(int cate_id);

	/**
	* Method : postInsert
	* 작성자 : 정요한
	* 변경이력 :
	* @param postVo
	* @return
	* Method 설명 : 게시글 등록
	*/
	int postInsert(PostVo postVo);

	/**
	* Method : getPost
	* 작성자 : 정요한
	* 변경이력 :
	* @param post_id
	* @return
	* Method 설명 : 게시글 갯수
	*/
	PostVo getPost(int post_id);

	/**
	* Method : postDelete
	* 작성자 : 정요한
	* 변경이력 :
	* @param post_id
	* @return
	* Method 설명 : 게시글 삭제
	*/
	int postDelete(int post_id);

	/**
	* Method : getLatestPost
	* 작성자 : 정요한
	* 변경이력 :
	* @return
	* Method 설명 : 최근 게시글
	*/
	PostVo getLatestPost();

	/**
	* Method : postPagingList
	* 작성자 : 정요한
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 게시글 페이징
	*/
	Map<String, Object> postPagingList(Map<String, Object> map);

	/**
	* Method : postCnt
	* 작성자 : 정요한
	* 변경이력 :
	* @param cate_id
	* @return
	* Method 설명 : 게시글 갯수
	*/
	int postCnt(int cate_id);

	/**
	* Method : postModify
	* 작성자 : 정요한
	* 변경이력 :
	* @param postVo
	* @return
	* Method 설명 : 게시글 수정
	*/
	int postModify(PostVo postVo);

	int updateStep(PostVo postVo);

	/**
	* Method : postReply
	* 작성자 : 정요한
	* 변경이력 :
	* @param postVo
	* @return
	* Method 설명 : 게시글 답글 등록
	*/
	int postReply(PostVo postVo);

	/**
	* Method : titlePagingList
	* 작성자 : 정요한
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 제목 검색 페이징 리스트
	*/
	Map<String, Object> titlePagingList(Map<String, Object> map);

	/**
	* Method : idPagingList
	* 작성자 : 정요한
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 아이디 검색 페이징 리스트
	*/
	Map<String, Object> idPagingList(Map<String, Object> map);

	/**
	* Method : contPagingList
	* 작성자 : 정요한
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 내용 검색 페이징 리스트
	*/
	Map<String, Object> contPagingList(Map<String, Object> map);
}
