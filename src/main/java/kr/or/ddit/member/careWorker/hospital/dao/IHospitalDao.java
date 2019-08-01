package kr.or.ddit.member.careWorker.hospital.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.member.careWorker.hospital.model.HospitalVo;
import kr.or.ddit.page.model.PageVo;

public interface IHospitalDao {
	
	/**
	* Method : hosList
	* 작성자 : ADMIN
	* 변경이력 :
	* @param 
	* @return
	* Method 설명 : 병원 전체 리스트 조회
	*/
	List<HospitalVo> hosList();
	
	/**
	* Method : hosPagingList
	* 작성자 : ADMIN
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 병원 페이징리스트
	*/
	List<HospitalVo> hosPagingList(PageVo pageVo);
	
	/**
	* Method : hosCnt
	* 작성자 : ADMIN
	* 변경이력 :
	* @param 
	* @return
	* Method 설명 : 전체 병원수 조회
	*/
	int hosCnt();
	

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
	* Method 설명 : 병원 검색(주소)
	*/
	List<HospitalVo> getSearchHosAdd(String hos_add);
	
	

}
