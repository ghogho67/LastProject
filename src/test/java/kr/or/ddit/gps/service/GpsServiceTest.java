package kr.or.ddit.gps.service;

import static org.junit.Assert.assertEquals;

import java.text.ParseException;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.gold.gps.model.GpsVo;
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
	
	
	
	
	@Test
	public void OneDayBpmTest() throws ParseException {
		/***Given***/
		
		
		GpsVo gpsVo = new GpsVo();
		gpsVo.setMem_id("brown");
		gpsVo.setGps_time("2019-07-26");

		List<GpsVo>list=null;
		
		/***When***/
		list=gpsService.oneDayBpm(gpsVo);

		/***Then***/
		assertEquals(841, list.size());
	}

}
