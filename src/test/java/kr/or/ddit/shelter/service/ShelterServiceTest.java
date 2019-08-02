package kr.or.ddit.shelter.service;

import static org.junit.Assert.assertEquals;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.category.others.shelter.model.ShelterVo;
import kr.or.ddit.category.others.shelter.service.IShelterService;
import kr.or.ddit.page.model.PageVo;
import kr.or.ddit.testenv.LogicTestEnv;

public class ShelterServiceTest extends LogicTestEnv{

	@Resource(name = "shelterService")
	private IShelterService shelterService;
	
	/**
	* Method : shelterListTest
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 :무더위 쉼터 전체 리스트 조회
	*/
	@Test
	public void shelterListTest() {
		/***Given***/

		/***When***/
		List<ShelterVo> shelterList = shelterService.shelterList();
		/***Then***/
		assertEquals(935, shelterList.size());
	}
	
	/**
	* Method : shelterPagingListTest
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 :무더위 쉼터 페이지네이션 테스트
	*/
	@Test
	public void shelterPagingListTest() {
		/***Given***/
		PageVo pageVo = new PageVo(1, 10);
		/***When***/
		Map<String, Object> resultMap = shelterService.shelterPagingList(pageVo);
		List<ShelterVo> shelterList = (List<ShelterVo>) resultMap.get("shelterList");
		int paginationSize = (Integer) resultMap.get("paginationSize");
		/***Then***/
		assertEquals(94, paginationSize);

	}
	
	/**
	* Method : getShelterTest
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 :특정 무더위 쉼터 조회 테스트
	*/
	@Test
	public void getShelterTest() {
		/***Given***/
		int sh_id = 1;
		/***When***/
		ShelterVo getShelter = shelterService.getShelter(sh_id);
		/***Then***/
		assertEquals("동구아름다운복지관", getShelter.getSh_nm());

	}
	
	/**
	* Method : getAddShelterListTest
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 : 지역으로 검색한 무더위 쉼터 테스트
	*/
	@Test
	public void getAddShelterListTest() {
		/***Given***/
		String sh_add = "어은동";
		/***When***/
		List<ShelterVo> getAddShelterList = shelterService.getAddShelterList(sh_add);
		/***Then***/
		assertEquals(3, getAddShelterList.size());

	}
	

}
