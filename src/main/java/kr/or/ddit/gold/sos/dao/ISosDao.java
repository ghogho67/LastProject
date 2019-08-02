package kr.or.ddit.gold.sos.dao;

import kr.or.ddit.gold.gps.model.GpsVo;

public interface ISosDao {
	int insertSOS(int gps_id);
	int recentData(String mem_id);
	GpsVo getGps(int gps_id);
	String getName(String mem_id);
}
