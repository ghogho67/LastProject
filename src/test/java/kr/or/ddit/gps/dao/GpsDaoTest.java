package kr.or.ddit.gps.dao;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.gold.gps.dao.IGpsDao;
import kr.or.ddit.testenv.LogicTestEnv;

public class GpsDaoTest extends LogicTestEnv{

	@Resource(name = "gpsDao")
	private IGpsDao gpsDao;
	@Test
	public void getCardiacTest() {
		

		/***When***/
		int bpm = gpsDao.getCardiac("brown");

		/***Then***/
		assertEquals(80, bpm);
	}
	
	

}
