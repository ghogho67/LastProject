package kr.or.ddit.sos.service;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.gold.sos.service.ISosService;
import kr.or.ddit.testenv.LogicTestEnv;

public class SosServiceTest extends LogicTestEnv{

	@Resource(name = "sosService")
	ISosService sosService;
	
	
	/**
	* Method : recentDataTest
	* 작성자 : PC24
	* 변경이력 :
	* Method 설명 : 긴급호출 최근 gps 아이디 얻기
	*/
	@Test
	public void recentDataTest() {

		/***When***/
		int getgpsId=sosService.recentData("brown");

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
		int cnt=sosService.insertSOS(156);
		
		/***Then***/
		assertEquals(1, cnt);
	}

}
