package kr.or.ddit.category.others.lecture.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.category.others.culture.model.CultureVo;
import kr.or.ddit.category.others.lecture.dao.ILectureDao;
import kr.or.ddit.category.others.lecture.model.LectureVo;

@Service
public class LectureService implements ILectureService {
	@Resource(name = "lectureDao")
	private ILectureDao lectureDao;

	@Override
	public List<LectureVo> getLectureList() {
		return lectureDao.getLectureList();
	}

	@Override
	public LectureVo getLecture(int lec_id) {
		return lectureDao.getLecture(lec_id);
	}

	@Override
	public List<LectureVo> getCertainLectureList(String lec_type) {
		return lectureDao.getCertainLectureList(lec_type);
	}

	@Override
	public int deleteLecture(int lec_id) {
		return lectureDao.deleteLecture(lec_id);
	}

	@Override
	public int useLecture(int lec_id) {
		return lectureDao.useLecture(lec_id);
	}

	@Override
	public int updateLecture(LectureVo LectureVo) {
		return lectureDao.updateLecture(LectureVo);
	}

	@Override
	public int InsertLecture(LectureVo LectureVo) {
		return lectureDao.InsertLecture(LectureVo);
	}

	@Override
	public CultureVo getCulture(int culture_id) {
		return lectureDao.getCulture(culture_id);
	}
	
}
