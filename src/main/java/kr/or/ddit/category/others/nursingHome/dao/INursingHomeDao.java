package kr.or.ddit.category.others.nursingHome.dao;

import java.util.List;

import kr.or.ddit.category.others.nursingHome.model.NursingHomeVo;
import kr.or.ddit.page.model.PageVo;

public interface INursingHomeDao {
	
	/**
	* Method : nursingList
	* 작성자 : ADMIN
	* 변경이력 :
	* @return
	* Method 설명 :요양시설 정체 리스트 조회
	*/
	List<NursingHomeVo> nursingList();
	
	/**
	* Method : nursingCnt
	* 작성자 : ADMIN
	* 변경이력 :
	* @return
	* Method 설명 :요양시설 전체 수 조회
	*/
	int nursingCnt();
	
	/**
	* Method : nursingPagingList
	* 작성자 : ADMIN
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 :요양시설 페이지 처리
	*/
	List<NursingHomeVo> nursingPagingList(PageVo pageVo);
	
	/**
	* Method : searchNursingHome
	* 작성자 : ADMIN
	* 변경이력 :
	* @param nh_add
	* @return
	* Method 설명 :요양시설 지역검색후 리스트 조회 (높은 평점 순)
	*/
	List<NursingHomeVo> searchNursingHome(String nh_add);
	
	/**
	* Method : getNursingHome
	* 작성자 : ADMIN
	* 변경이력 :
	* @param nh_id
	* @return
	* Method 설명 :특정 요양시설 상세보기
	*/
	NursingHomeVo getNursingHome(int nh_id);

}
