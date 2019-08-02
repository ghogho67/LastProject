package kr.or.ddit.gold.sos.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.gold.gps.model.GpsVo;
import kr.or.ddit.gold.sos.dao.ISosDao;

@Service
public class SosService implements ISosService {

	@Resource(name = "sosDao")
	private ISosDao sosDao;

	@Override
	public int insertSOS(int gps_id) {
		return sosDao.insertSOS(gps_id);
	}

	@Override
	public int recentData(String mem_id) {
		return sosDao.recentData(mem_id);
	}

	@Override
	public Map<String, Object> getGps(int gps_id, String mem_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		GpsVo gpsVo = sosDao.getGps(gps_id);
		String mem_name = sosDao.getName(mem_id);
		map.put("gpsVo", gpsVo);
		map.put("mem_name", mem_name);
		
		return map;
	}

}
