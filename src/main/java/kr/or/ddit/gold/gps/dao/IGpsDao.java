package kr.or.ddit.gold.gps.dao;

import kr.or.ddit.gold.gps.model.GpsVo;

public interface IGpsDao {
	int insertGps(GpsVo gpsVo);
	
	GpsVo getGoldMember(String mem_id);
	
	int getCardiac(String mem_id);
	
	
	

}
