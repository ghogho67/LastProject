package kr.or.ddit.member.careWorker.career.service;

import java.util.List;

import kr.or.ddit.member.careWorker.career.model.CareerVo;

public interface ICareerService {
	List<CareerVo> careerList(String mem_id);
}
