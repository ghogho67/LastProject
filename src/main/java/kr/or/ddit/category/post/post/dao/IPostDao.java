package kr.or.ddit.category.post.post.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.category.post.post.model.PostVo;

public interface IPostDao {

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
	* Method 설명 : 게시글 저장
	*/
	int postInsert(PostVo postVo);

	/**
	* Method : postModify
	* 작성자 : 정요한
	* 변경이력 :
	* @param pvo
	* @return
	* Method 설명 : 게시글 수정
	*/
	int postModify(PostVo pvo);

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
	* Method 설명 : 최근 게시글 가져오기
	*/
	PostVo getLatestPost();

	int updateStep(PostVo PostVo);

	/**
	* Method : postReply
	* 작성자 : 정요한
	* 변경이력 :
	* @param PostVo
	* @return
	* Method 설명 : 게시글 답글 등록
	*/
	int postReply(PostVo PostVo);

	/**
	* Method : postPagingList
	* 작성자 : 정요한
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 게시글 페이징 리스트
	*/
	List<PostVo> postPagingList(Map<String, Object> map);

	/**
	* Method : getPost
	* 작성자 : 정요한
	* 변경이력 :
	* @param post_id
	* @return
	* Method 설명 : 게시글 가져오기
	*/
	PostVo getPost(int post_id);

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
	* Method : titlePagingList
	* 작성자 : 정요한
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 제목 검색 페이징 리스트
	*/
	List<PostVo> titlePagingList(Map<String, Object> map);

	/**
	* Method : idPagingList
	* 작성자 : 정요한
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 아이디 검색 페이징 리스트
	*/
	List<PostVo> idPagingList(Map<String, Object> map);

	/**
	* Method : contPagingList
	* 작성자 : 정요한
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 내용 검색 페이징 리스트
	*/
	List<PostVo> contPagingList(Map<String, Object> map);

	/**
	* Method : titlePostCnt
	* 작성자 : 정요한
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 제목 전체 갯수 
	*/
	int titlePostCnt(Map<String, Object> map);

	/**
	* Method : idPostCnt
	* 작성자 : 정요한
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 아이디 검색 전체 갯수
	*/
	int idPostCnt(Map<String, Object> map);

	/**
	* Method : contPostCnt
	* 작성자 : 정요한
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 내용 검색 전체 갯수
	*/
	int contPostCnt(Map<String, Object> map);

}
