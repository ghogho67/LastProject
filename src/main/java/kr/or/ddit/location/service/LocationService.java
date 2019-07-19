package kr.or.ddit.location.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.location.dao.ILocationDao;

@Service
public class LocationService implements ILocationService{
	@Resource(name = "locationDao")
	private ILocationDao locationDao;
}
