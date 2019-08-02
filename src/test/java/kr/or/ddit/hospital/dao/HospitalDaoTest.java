package kr.or.ddit.hospital.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.member.careWorker.hospital.dao.IHospitalDao;
import kr.or.ddit.member.careWorker.hospital.model.HospitalVo;
import kr.or.ddit.page.model.PageVo;
import kr.or.ddit.testenv.LogicTestEnv;

public class HospitalDaoTest extends LogicTestEnv{

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
		assertEquals(64, hosList.size());
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
	
	
	
	
	

}
