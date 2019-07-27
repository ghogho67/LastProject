package kr.or.ddit.gold.gps.service;

import kr.or.ddit.gold.gps.model.GpsVo;

public interface IGpsService {
	
	int insertGps(GpsVo gpsVo);
	
	GpsVo getGoldMember(String mem_id);
	
	int getCardiac(String mem_id);

}
