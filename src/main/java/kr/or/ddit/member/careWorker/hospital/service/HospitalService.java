package kr.or.ddit.member.careWorker.hospital.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.member.careWorker.hospital.dao.IHospitalDao;

@Service
public class HospitalService implements IHospitalService{
	@Resource(name = "hospitalDao")
	private IHospitalDao hospitalDao;
}
