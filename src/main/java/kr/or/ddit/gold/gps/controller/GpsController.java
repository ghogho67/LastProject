package kr.or.ddit.gold.gps.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.gold.gps.model.GpsVo;
import kr.or.ddit.gold.gps.service.IGpsService;
@RequestMapping("/gps")
@Controller
public class GpsController {
	
	private static final Logger logger = LoggerFactory.getLogger(GpsController.class);
	@Resource(name = "gpsService")
	private IGpsService gpsService;
	
	@RequestMapping("/insertGps")
	public void insertGps(  int car_bpm,
						    double gps_lo,double gps_la) {
		logger.debug("!!!!!!!car_bpm :{}",car_bpm);
		logger.debug("!!!!!!!gps_lo :{}",gps_lo);
		logger.debug("!!!!!!!gps_la :{}",gps_la);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		
		GpsVo gpsVo =  new GpsVo();
		gpsVo.setCar_bpm(car_bpm);
		if(gps_lo==1000.00000 &&gps_la==1000.00000) {
			gps_la=36.324964;
			gps_lo=127.420138;
		}
		gpsVo.setGps_la(gps_la);
		gpsVo.setGps_lo(gps_lo);
		gpsVo.setMem_id("brown");
		try {
			gpsVo.setGold_st(sdf.parse("19/07/21"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		gpsService.insertGps(gpsVo);
		
		
	}

}
