package kr.or.ddit.member.careWorker.career.dao;

import java.util.List;

import kr.or.ddit.member.careWorker.career.model.CareerVo;

public interface ICareerDao {
	List<CareerVo> careerList(String mem_id);
}
