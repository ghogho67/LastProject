package kr.or.ddit.serviceType.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.serviceType.dao.IServiceTypeDao;

@Service
public class ServiceTypeService implements IServiceTypeService{

	@Resource(name = "serviceTypeDao")
	private IServiceTypeDao serviceTypeDao;
}
