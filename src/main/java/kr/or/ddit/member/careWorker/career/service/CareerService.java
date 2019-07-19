package kr.or.ddit.member.careWorker.career.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.member.careWorker.career.dao.ICareerDao;

@Service
public class CareerService implements ICareerService{
	
	@Resource(name = "careerDao")
	private ICareerDao careerDao;
} 
