package kr.or.ddit.gps.dao;

import static org.junit.Assert.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.gold.gps.dao.IGpsDao;
import kr.or.ddit.gold.gps.model.GpsVo;
import kr.or.ddit.testenv.LogicTestEnv;

public class GpsDaoTest extends LogicTestEnv{

	@Resource(name = "gpsDao")
	private IGpsDao gpsDao;
	@Test
	public void getCardiacTest() {
		

		/***When***/
		int bpm = gpsDao.getCardiac("brown");

		/***Then***/
		assertEquals(79, bpm);
	}
	
	
	@Test
	public void OneDayBpmTest() throws ParseException {
		/***Given***/
		
		
		
		GpsVo gpsVo = new GpsVo();
		gpsVo.setMem_id("brown");
		gpsVo.setGps_time("2019-07-26");

		List<GpsVo>list=null;
		
		/***When***/
		list=gpsDao.oneDayBpm(gpsVo);

		/***Then***/
		assertEquals(841, list.size());
	}
	
	
	

}
