package kr.or.ddit.shelter.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.category.others.shelter.dao.IShelterDao;
import kr.or.ddit.category.others.shelter.model.ShelterVo;
import kr.or.ddit.page.model.PageVo;
import kr.or.ddit.testenv.LogicTestEnv;

public class ShelterDaoTest extends LogicTestEnv{

	@Resource(name = "shelterDao")
	private IShelterDao shelterDao;
	
	/**
	* Method : shelterList
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 : 무더위 쉼터 전체 리스트 조회 테스트
	*/
	@Test
	public void shelterList() {
		/***Given***/

		/***When***/
		List<ShelterVo> shelterList = shelterDao.shelterList();
		/***Then***/
		assertEquals(935, shelterList.size());

	}
	
	/**
	* Method : shelterCntTest
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 :무더위 쉼터 전체 수 조회
	*/
	@Test
	public void shelterCntTest() {
		/***Given***/

		/***When***/
		int shelterCnt = shelterDao.shelterCnt();
		/***Then***/
		assertEquals(935, shelterCnt);

	}
	
	/**
	* Method : shelterPagingListTest
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 :무더위 쉼터 페이지 네이션 테스트
	*/
	@Test
	public void shelterPagingListTest() {
		/***Given***/
		PageVo pageVo = new PageVo(1, 10);
		/***When***/
		List<ShelterVo> shelterPagingList = shelterDao.shelterPagingList(pageVo);
		/***Then***/
		assertEquals(10, shelterPagingList.size());
	}
	
	/**
	* Method : getShelterTest
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 :특정 무더위 쉼터 조회
	*/
	@Test
	public void getShelterTest() {
		/***Given***/
		int sh_id = 1;
		/***When***/
		ShelterVo getShelter = shelterDao.getShelter(sh_id);
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
		List<ShelterVo> getAddShelterList = shelterDao.getAddShelterList(sh_add);
		/***Then***/
		assertEquals(3, getAddShelterList.size());
	}
	
	/**
	* Method : searchMapListTest
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 :지역 검색 후 주소 리스트
	*/
	@Test
	public void searchMapListTest() {
		/***Given***/
		String sh_add = "어은동";
		/***When***/
		List<String> searchMapList = shelterDao.searchMapList(sh_add);
		/***Then***/
		assertEquals(3, searchMapList.size());

	}
	

}
