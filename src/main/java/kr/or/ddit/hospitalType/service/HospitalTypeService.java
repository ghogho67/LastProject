package kr.or.ddit.hospitalType.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.hospitalType.dao.IHospitalTypeDao;

@Service
public class HospitalTypeService implements IHospitalTypeService {
	@Resource(name = "hospitalTypeDao")
	private IHospitalTypeDao hospitalTypeDao;
}
