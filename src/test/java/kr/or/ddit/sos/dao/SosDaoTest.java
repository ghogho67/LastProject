package kr.or.ddit.sos.dao;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;

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
		assertEquals(157, getgpsId);
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

}
