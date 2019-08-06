package kr.or.ddit.nursingHome.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.category.others.nursingHome.dao.INursingHomeDao;
import kr.or.ddit.category.others.nursingHome.model.NursingHomeVo;
import kr.or.ddit.page.model.PageVo;
import kr.or.ddit.testenv.LogicTestEnv;

public class NursingHomeDaoTest extends LogicTestEnv{
	
	private static final Logger logger = LoggerFactory.getLogger(NursingHomeDaoTest.class);

	@Resource(name = "nursingHomeDao")
	private INursingHomeDao nursingHomeDao;
	
	
	/**
	* Method : nursingListTest
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 : 요양시설 전체 리스트
	*/
	@Test
	public void nursingListTest() {
		/***Given***/

		/***When***/
		NursingHomeVo nursingHomeVo = new NursingHomeVo();
		logger.debug("☞nursingHomeVo:{}",nursingHomeVo);
		
		List<NursingHomeVo> nursingList = nursingHomeDao.nursingList();
		/***Then***/
		assertEquals(120, nursingList.size());
	}
	
	/**
	* Method : nursingCntTest
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 :요양 시설 전체 리스트 개수 조회
	*/
	@Test
	public void nursingCntTest() {
		/***Given***/

		/***When***/
		int nursingCnt = nursingHomeDao.nursingCnt();
		/***Then***/
		assertEquals(120, nursingCnt);
	}
	
	/**
	* Method : nursingPagingListTest
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 :요양시설 페이징 처리
	*/
	@Test
	public void nursingPagingListTest() {
		/***Given***/
		PageVo pageVo = new PageVo(1, 10);
		/***When***/
		List<NursingHomeVo> nursingPagingList = nursingHomeDao.nursingPagingList(pageVo);

		/***Then***/
//		assertEquals(12, nursingPagingList.size());
		assertNotNull(nursingPagingList);

	}
	
	/**
	* Method : searchNursingHomeTest
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 :지역 검색 후 리스트 조회
	*/
	@Test
	public void searchNursingHomeTest() {
		/***Given***/
		String nh_add = "지족동"; 
		/***When***/
		List<NursingHomeVo> searchNursingHome = nursingHomeDao.searchNursingHome(nh_add);
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
		NursingHomeVo getNursingHome = nursingHomeDao.getNursingHome(nh_id);
		/***Then***/
		assertEquals("유성사랑마루", getNursingHome.getNh_nm());

	}
	
}
