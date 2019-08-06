package kr.or.ddit.nursingHome.service;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.category.others.nursingHome.model.NursingHomeVo;
import kr.or.ddit.category.others.nursingHome.service.INursingHomeService;
import kr.or.ddit.page.model.PageVo;
import kr.or.ddit.testenv.LogicTestEnv;

public class NursingHomeServiceTest extends LogicTestEnv{

	@Resource(name = "nursingHomeService")
	private INursingHomeService nursingHomeService;
	
	/**
	* Method : nursingListTest
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 :요양시설 전체 리스트 조회
	*/
	@Test
	public void nursingListTest() {
		/***Given***/

		/***When***/
		List<NursingHomeVo> nursingList = nursingHomeService.nursingList();
		/***Then***/
		assertEquals(120, nursingList.size());
	}
	
	/**
	* Method : nursingPagingListTest
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 : 요양시설 페이징 처리
	*/
	@Test
	public void nursingPagingListTest() {
		/***Given***/
		PageVo pageVo = new PageVo();
		/***When***/
		Map<String, Object> resultMap = nursingHomeService.nursingPagingList(pageVo);
		List<NursingHomeVo> nursingPagingList = (List<NursingHomeVo>) resultMap.get("nursingList");
		int paginationSize = (Integer) resultMap.get("paginationSize");
		/***Then***/
		assertEquals(12, paginationSize);
	}
	
	/**
	* Method : searchNursingHomeTest
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 : 지역검색 후 리스트 조회
	*/
	@Test
	public void searchNursingHomeTest() {
		/***Given***/
		String nh_add = "지족동";
		/***When***/
		List<NursingHomeVo> searchNursingHome = nursingHomeService.searchNursingHome(nh_add);
		/***Then***/
		assertEquals(12, searchNursingHome.size());
	}
	
	/**
	* Method : getNursingHomeTest
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 : 상세보기 테스트
	*/
	@Test
	public void getNursingHomeTest() {
		/***Given***/
		int nh_id = 1;
		/***When***/
		NursingHomeVo getNursingHome = nursingHomeService.getNursingHome(nh_id);
		/***Then***/
		assertEquals("유성사랑마루", getNursingHome.getNh_nm());

	}

}
