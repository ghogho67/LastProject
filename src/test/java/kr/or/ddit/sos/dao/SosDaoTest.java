package kr.or.ddit.sos.dao;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.gold.gps.model.GpsVo;
import kr.or.ddit.gold.sos.dao.ISosDao;
import kr.or.ddit.testenv.LogicTestEnv;

public class SosDaoTest extends LogicTestEnv{
	@Resource(name = "sosDao")
	ISosDao sosDao;

	
	/**
	* Method : recentDataTest
	* 작성자 : PC24
	* 변경이력 :
	* Method 설명 : 긴급호출 최근 gps 아이디 얻기
	*/
	@Test
	public void recentDataTest() {

		/***When***/
		int getgpsId=sosDao.recentData("brown");

		/***Then***/
		assertEquals(1148, getgpsId);
	}
	
	/**
	* Method : insertSOSTest
	* 작성자 : PC24
	* 변경이력 :
	* Method 설명 : 긴급호출 데이터 저장
	*/
	@Test
	public void insertSOSTest() {
		
		/***When***/
		int cnt=sosDao.insertSOS(156);
		
		/***Then***/
		assertEquals(1, cnt);
	}
	
	
	/**
	* Method : getGps
	* 작성자 : PC24
	* 변경이력 :
	* Method 설명 : gpsid로 gps정보 가져오는 테스트
	*/
	@Test
	public void getGps() {
		/***Given***/
		GpsVo gpsVo;
	
		
		/***When***/
		gpsVo = sosDao.getGps(187);
		
		/***Then***/
		assertNotNull(gpsVo);
	}
	@Test
	public void getName() {
		
		
		/***When***/
		String name = sosDao.getName("brown");
		
		/***Then***/
		assertEquals("브라운", name);
	}

}
