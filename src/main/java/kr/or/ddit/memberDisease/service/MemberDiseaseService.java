package kr.or.ddit.memberDisease.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.memberDisease.dao.IMemberDiseaseDao;

@Service
public class MemberDiseaseService implements IMemberDiseaseService {
	
	@Resource(name = "memberDiseaseDao")
	private IMemberDiseaseDao memberDiseaseDao;
	
	
}
