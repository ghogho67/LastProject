package kr.or.ddit.gold.gps.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public void insertGps(  @RequestParam(value = "car_bpm")int car_bpm, @RequestParam(value = "mem_id") String mem_id,
							@RequestParam(value = "gps_lo")double gps_lo, @RequestParam(value = "gps_la")double gps_la) {
		logger.debug("!!!!!!!car_bpm :{}",car_bpm);
		logger.debug("!!!!!!!gps_lo :{}",gps_lo);
		logger.debug("!!!!!!!gps_la :{}",gps_la);
		logger.debug("!!!!!!!mem_id :{}",mem_id);
		
		GpsVo getMemberVo  = gpsService.getGoldMember(mem_id); 
		
		GpsVo gpsVo =  new GpsVo();
		gpsVo.setCar_bpm(car_bpm);
		if(gps_lo==1000.00000 &&gps_la==1000.00000) {
			gps_la=36.324964;
			gps_lo=127.420138;
		}
		gpsVo.setGps_la(gps_la);
		gpsVo.setGps_lo(gps_lo);
		gpsVo.setMem_id(mem_id);
		gpsVo.setGold_st(getMemberVo.getGold_st());
		
		gpsService.insertGps(gpsVo);
		
		
	}
	
	@RequestMapping("/getCardiac")
	public String getCardiac(Model model, String mem_id) {
		
		logger.debug("!!!!!!!mem_id :{}",mem_id);
		
		int bpm = gpsService.getCardiac(mem_id);
		logger.debug("!!!!!!!bpm :{}",bpm);
		model.addAttribute("bpm",bpm);
		return "jsonView";
	}
	

}
