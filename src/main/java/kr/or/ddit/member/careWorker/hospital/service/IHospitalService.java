package kr.or.ddit.member.careWorker.hospital.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.member.careWorker.hospital.model.HospitalVo;
import kr.or.ddit.page.model.PageVo;

public interface IHospitalService {
	
	/**
	* Method : hosList
	* 작성자 : ADMIN
	* 변경이력 :
	* @return
	* Method 설명 :병원 전체 정보 조회
	*/
	List<HospitalVo> hosList();

	/**
	* Method : hosPagingList
	* 작성자 : ADMIN
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 :병원 페이징 리스트 조회
	*/
	Map<String, Object> hosPagingList(PageVo pageVo);
	
	/**
	* Method : getHospital
	* 작성자 : ADMIN
	* 변경이력 :
	* @param hos_id
	* @return
	* Method 설명 :특정 병원 조회
	*/
	HospitalVo getHospital(int hos_id);
	
	/**
	* Method : getSearchHosAdd
	* 작성자 : ADMIN
	* 변경이력 :
	* @param hos_add
	* @return
	* Method 설명 : 지역 검색한 병원 리스트 조회
	*/
	List<HospitalVo> getSearchHosAdd(String hos_add);
	
	/**
	* Method : searchHosPagingList
	* 작성자 : ADMIN
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 :지역검색을 한 후 병원 페이징 리스트
	*/
	Map<String, Object> searchHosPagingList(Map<String, Object> map);
	
}
