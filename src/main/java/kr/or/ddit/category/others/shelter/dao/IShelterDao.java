package kr.or.ddit.category.others.shelter.dao;

import java.util.List;

import kr.or.ddit.category.others.shelter.model.ShelterVo;
import kr.or.ddit.page.model.PageVo;

public interface IShelterDao {
	
	/**
	* Method : shelterList
	* 작성자 : ADMIN
	* 변경이력 :
	* @return
	* Method 설명 :무더위 쉼터 전체 조회
	*/
	List<ShelterVo> shelterList();
	
	/**
	* Method : shelterCnt
	* 작성자 : ADMIN
	* 변경이력 :
	* @return
	* Method 설명 :무더위 쉼터 전체 수 조회
	*/
	int shelterCnt();
	
	/**
	* Method : shelterPagingList
	* 작성자 : ADMIN
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 :무더위 쉼터 페이징 리스트
	*/
	List<ShelterVo> shelterPagingList(PageVo pageVo);
	
	/**
	* Method : shelterVo
	* 작성자 : ADMIN
	* 변경이력 :
	* @param sh_id
	* @return
	* Method 설명 : 특정 무더위 쉼터 조회
	*/
	ShelterVo getShelter (int sh_id);
	
	/**
	* Method : getAddShelterList
	* 작성자 : ADMIN
	* 변경이력 :
	* @param sh_add
	* @return
	* Method 설명 : 지역으로 검색한 무터위 쉼터 조회
	*/
	List<ShelterVo> getAddShelterList(String sh_add);
	
}
