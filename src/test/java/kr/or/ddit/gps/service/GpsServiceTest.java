package kr.or.ddit.gps.service;

import static org.junit.Assert.assertEquals;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.gold.gps.service.IGpsService;
import kr.or.ddit.testenv.LogicTestEnv;

public class GpsServiceTest extends LogicTestEnv{

	@Resource(name = "gpsService")
	private IGpsService gpsService;
	@Test
	public void getCardiacTest() {
		

		/***When***/
		int bpm = gpsService.getCardiac("brown");

		/***Then***/
		assertEquals(80, bpm);
	}

}
