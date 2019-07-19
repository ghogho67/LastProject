package kr.or.ddit.lecture.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.lecture.dao.ILectureDao;

@Service
public class LectureService implements ILectureService {
	@Resource(name = "lectureDao")
	private ILectureDao lectureDao;
	
}
