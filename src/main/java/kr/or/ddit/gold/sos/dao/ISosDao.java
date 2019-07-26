package kr.or.ddit.gold.sos.dao;

public interface ISosDao {
	int insertSOS(int gps_id);
	int recentData(String mem_id);
}
