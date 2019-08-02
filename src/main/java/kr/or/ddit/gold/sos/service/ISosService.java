package kr.or.ddit.gold.sos.service;

import java.util.Map;


public interface ISosService {
	int insertSOS(int gps_id);
	
	int recentData(String mem_id);
	
	Map<String, Object> getGps(int gps_id, String mem_id);

}
