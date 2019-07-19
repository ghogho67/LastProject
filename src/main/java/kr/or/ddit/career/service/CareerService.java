package kr.or.ddit.career.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.career.dao.ICareerDao;

@Service
public class CareerService implements ICareerService{
	
	@Resource(name = "careerDao")
	private ICareerDao careerDao;
} 
