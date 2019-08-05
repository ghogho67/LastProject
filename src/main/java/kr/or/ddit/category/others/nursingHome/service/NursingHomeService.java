package kr.or.ddit.category.others.nursingHome.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.category.others.nursingHome.dao.INursingHomeDao;

@Service
public class NursingHomeService {
	
	@Resource(name = "nursingHomeDao")
	private INursingHomeDao nursingHomeDao;
	
	

}
