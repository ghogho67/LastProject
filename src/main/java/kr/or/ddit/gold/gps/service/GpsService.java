package kr.or.ddit.gold.gps.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

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
	public GpsVo getGoldMember(String mem_id) {
		return gpsDao.getGoldMember(mem_id);
	}
}
