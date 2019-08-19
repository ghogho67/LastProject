package kr.or.ddit.member.careWorker.location.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.member.careWorker.location.dao.ILocationDao;
import kr.or.ddit.member.careWorker.location.model.LocationVo;

@Service
public class LocationService implements ILocationService{
	@Resource(name = "locationDao")
	private ILocationDao locationDao;
	
	@Override
	public List<LocationVo> getLocationList(String mem_id) {
		// TODO Auto-generated method stub
		return locationDao.getLocationList(mem_id);
	}
}
