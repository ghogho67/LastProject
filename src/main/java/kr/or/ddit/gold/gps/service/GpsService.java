package kr.or.ddit.gold.gps.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.gold.gold.model.GoldVo;
import kr.or.ddit.gold.gps.dao.IGpsDao;
import kr.or.ddit.gold.gps.model.GpsVo;

@Service
public class GpsService implements IGpsService {
	@Resource(name = "gpsDao")
	private IGpsDao gpsDao;

	@Override
	public int insertGps(GpsVo gpsVo) {
		return gpsDao.insertGps(gpsVo);
	}

	@Override
	public GoldVo getGoldMember(String mem_id) {
		return gpsDao.getGoldMember(mem_id);
	}

	@Override
	public int getCardiac(String mem_id) {
		// TODO Auto-generated method stub
		return gpsDao.getCardiac(mem_id);
	}

	@Override
	public List<GpsVo> oneDayBpm(GpsVo gpsVo) {
		// TODO Auto-generated method stub
		return gpsDao.oneDayBpm(gpsVo);
	}
}
