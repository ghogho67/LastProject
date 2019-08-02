package kr.or.ddit.category.others.shelter.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.category.others.shelter.model.ShelterVo;
import kr.or.ddit.page.model.PageVo;

public interface IShelterService {
	
	/**
	* Method : shelterList
	* 작성자 : ADMIN
	* 변경이력 :
	* @return
	* Method 설명 :무더위 쉼터 리스트 조회
	*/
	List<ShelterVo> shelterList();
	
	/**
	* Method : shelterPagingList
	* 작성자 : ADMIN
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 :무더위 쉼터 페이징 리스트
	*/
	Map<String, Object> shelterPagingList(PageVo pageVo);
	
	/**
	* Method : getShelter
	* 작성자 : ADMIN
	* 변경이력 :
	* @param sh_id
	* @return
	* Method 설명 :특정 무더위 쉼터 조회
	*/
	ShelterVo getShelter(int sh_id);
	
	/**
	* Method : getAddShelterList
	* 작성자 : ADMIN
	* 변경이력 :
	* @param sh_add
	* @return
	* Method 설명 :지역으로 검색한 무더위 쉼터
	*/
	List<ShelterVo> getAddShelterList(String sh_add);

}



