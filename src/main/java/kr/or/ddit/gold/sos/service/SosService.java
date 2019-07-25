package kr.or.ddit.gold.sos.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

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
}
