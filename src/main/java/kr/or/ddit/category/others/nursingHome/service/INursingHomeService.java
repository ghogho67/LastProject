package kr.or.ddit.category.others.nursingHome.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.category.others.nursingHome.model.NursingHomeVo;
import kr.or.ddit.page.model.PageVo;

public interface INursingHomeService {
	
	/**
	* Method : nursingList
	* 작성자 : ADMIN
	* 변경이력 :
	* @return
	* Method 설명 :요양시설 전체 리스트 조회(높은 평점 순)
	*/
	List<NursingHomeVo> nursingList();
	
	/**
	* Method : nursingPagingList
	* 작성자 : ADMIN
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : 요양시설 리스트 페이지 처리(높은 평점 순)
	*/
	Map<String, Object> nursingPagingList(PageVo pageVo);
	
	/**
	* Method : searchNursingHome
	* 작성자 : ADMIN
	* 변경이력 :
	* @param nh_add
	* @return
	* Method 설명 :지역으로 검색 후 요양시설 리스트 조회(높은 평점순 )
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
