package kr.or.ddit.gold.gps.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.gold.gps.dao.IGpsDao;

@Service
public class GpsService implements IGpsService {
	@Resource(name = "gpsDao")
	private IGpsDao gpsDao;
}
