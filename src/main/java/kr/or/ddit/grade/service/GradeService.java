package kr.or.ddit.grade.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.grade.dao.IGradeDao;

@Service
public class GradeService implements IGradeService {
	@Resource(name = "gradeDao")
	private IGradeDao gradeDao;
}
