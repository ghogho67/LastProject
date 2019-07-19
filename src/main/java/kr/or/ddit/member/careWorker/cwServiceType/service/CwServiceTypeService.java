package kr.or.ddit.member.careWorker.cwServiceType.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.member.careWorker.cwServiceType.dao.ICwServiceTypeDao;

@Service
public class CwServiceTypeService implements ICwServiceTypeService {
	@Resource(name = "cwServiceTypeDao")
	private ICwServiceTypeDao cwServiceTypeDao;
}
