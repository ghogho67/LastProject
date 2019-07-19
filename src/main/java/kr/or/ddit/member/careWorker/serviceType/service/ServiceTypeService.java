package kr.or.ddit.member.careWorker.serviceType.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.member.careWorker.serviceType.dao.IServiceTypeDao;

@Service
public class ServiceTypeService implements IServiceTypeService{

	@Resource(name = "serviceTypeDao")
	private IServiceTypeDao serviceTypeDao;
}
