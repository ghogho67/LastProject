package kr.or.ddit.hospital.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.member.careWorker.hospital.model.HospitalVo;
import kr.or.ddit.member.careWorker.hospital.service.IHospitalService;
import kr.or.ddit.page.model.PageVo;
import kr.or.ddit.testenv.LogicTestEnv;

public class HospitalServiceTest extends LogicTestEnv{
	
	private static final Logger logger = LoggerFactory.getLogger(HospitalServiceTest.class);

	@Resource(name="hospitalService")
	private IHospitalService hospitalService;
	
	/**
	* Method : hosListTest
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 : 병원 전체 리스트 조회
	*/
	@Test
	public void hosListTest() {
		/***Given***/

		/***When***/
		List<HospitalVo> hosList = hospitalService.hosList();
		/***Then***/
		assertEquals(64, hosList.size());
	}
	
	
	
	/**
	* Method : hosPagingList
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 :  병원 페이징 리스트 조회
	*/
	@Test
	public void hosPagingListTets() {
		/***Given***/
		PageVo pageVo = new PageVo(1, 10);
		/***When***/
		Map<String, Object> resultMap = hospitalService.hosPagingList(pageVo);
		List<HospitalVo> hosList = (List<HospitalVo>) resultMap.get("hosList");
		int paginationSize = (Integer) resultMap.get("paginationSize");
		/***Then***/
		assertEquals(7, paginationSize);

	}
	
	/**
	* Method : getHospitalTest
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 :병원아이디로 병원 검색
	*/
	@Test
	public void getHospitalTest() {
		/***Given***/
		int hos_id = 22;
		/***When***/
		HospitalVo hospitalVo = hospitalService.getHospital(hos_id);
		/***Then***/
		assertEquals("01028490809", hospitalVo.getHos_phone());

	}
	
	/**
	* Method : getSearchHosAddTest
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 :지역단위로 병원 검색
	*/
	@Test
	public void getSearchHosAddTest() {
		/***Given***/
		String hos_add = "서구";
		/***When***/
		List<HospitalVo> getSearchHosAdd = hospitalService.getSearchHosAdd(hos_add);
		/***Then***/
		assertEquals(25, getSearchHosAdd.size());

	}
	
	@Test
	public void searchHosPagingList() {
		/***Given***/
		PageVo pageVo = new PageVo(1, 10);
		HospitalVo hospitalVo = new HospitalVo("서구");
		
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("hos_add", hospitalVo.getHos_add());
		map.put("page", pageVo.getPage());
		map.put("pageSize", pageVo.getPageSize());
		
		logger.debug("☞hos_add:{}",hospitalVo.getHos_add());
		logger.debug("☞page:{}",pageVo.getPage());
		logger.debug("☞pageSize:{}",pageVo.getPageSize());
		
		/***When***/
		Map<String, Object> searchHosPagingList = hospitalService.searchHosPagingList(map);
		/***Then***/
		assertNotNull(searchHosPagingList);
	}
	
}
