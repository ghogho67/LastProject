package kr.or.ddit.member.careWorker.career.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.member.careWorker.career.dao.ICareerDao;
import kr.or.ddit.member.careWorker.career.model.CareerVo;

@Service
public class CareerService implements ICareerService{
	
	@Resource(name = "careerDao")
	private ICareerDao careerDao;
	
	@Override
	public List<CareerVo> careerList(String mem_id) {
		// TODO Auto-generated method stub
		return careerDao.careerList(mem_id);
	}
} 
