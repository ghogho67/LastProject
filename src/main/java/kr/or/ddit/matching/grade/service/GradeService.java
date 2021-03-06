package kr.or.ddit.matching.grade.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.matching.grade.dao.IGradeDao;

@Service
public class GradeService implements IGradeService {
	@Resource(name = "gradeDao")
	private IGradeDao gradeDao;

	@Override
	public String cwGradeAvg(String mem_id) {
		return gradeDao.cwGradeAvg(mem_id);
	}
}
