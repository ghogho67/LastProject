package kr.or.ddit.hospital.dao;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.member.careWorker.hospital.dao.IHospitalDao;
import kr.or.ddit.member.careWorker.hospital.model.HospitalVo;
import kr.or.ddit.page.model.PageVo;
import kr.or.ddit.testenv.LogicTestEnv;

public class HospitalDaoTest extends LogicTestEnv{
	
	private static final Logger logger = LoggerFactory.getLogger(HospitalDaoTest.class);

	@Resource(name = "hospitalDao")
	private IHospitalDao hospitalDao;
	
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
		List<HospitalVo> hosList = hospitalDao.hosList();
		/***Then***/
		assertEquals(64, hosList.size());
	}
	
	/**
	* Method : hosCntTest
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 : 전체 병원수 조회
	*/
	@Test
	public void hosCntTest() {
		/***Given***/

		/***When***/
		int hosCnt = hospitalDao.hosCnt();
		/***Then***/
		assertEquals(64, hosCnt);
	}
	
	
	/**
	* Method : hosPagingList
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 :  병원 페이징 리스트 조회
	*/
	@Test
	public void hosPagingListTest() {
		/***Given***/
		PageVo pageVo = new PageVo(1, 10);
		/***When***/
		List<HospitalVo> hosList= hospitalDao.hosPagingList(pageVo);

		/***Then***/
		assertEquals(10, hosList.size());
		assertNotNull(hosList);

	}
	
	/**
	* Method : getHospitalTest
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 :병원 아이디로 병원 조회
	*/
	@Test
	public void getHospitalTest() {
		/***Given***/
		int hos_id = 22;
		/***When***/
		HospitalVo hospitalVo = hospitalDao.getHospital(hos_id);
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
		List<HospitalVo> getSearchHosAdd = hospitalDao.getSearchHosAdd(hos_add);
		/***Then***/
		assertEquals(25, getSearchHosAdd.size());
		
	}
	
	/**
	* Method : searchHosCntTest
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 :지역검색을 한 병원 수
	*/
	@Test
	public void searchHosCntTest() {
		/***Given***/
		String hos_add = "서구";
		/***When***/
		int searchHosCnt = hospitalDao.searchHosCnt(hos_add);
		/***Then***/
		assertEquals(25, searchHosCnt);
	}
	
	/**
	* Method : searchHosPagingListTest
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 :지역단위로 검색한 후 페이징 리스트
	*/
	@Test
	public void searchHosPagingListTest() {
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
		List<HospitalVo> searchHosPagingList = hospitalDao.searchHosPagingList(map);
		/***Then***/
		assertNotNull(searchHosPagingList);

	}
	
	/**
	* Method : searchMapList
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 :지역 검색 후 주소 리스트 조회
	*/
	@Test
	public void searchMapList() {
		/***Given***/
		String hos_add = "서구";
		/***When***/
		List<String> searchMapList = hospitalDao.searchMapList(hos_add);
		/***Then***/
		assertEquals(25, searchMapList.size());
	}
	
	
	
	

}
