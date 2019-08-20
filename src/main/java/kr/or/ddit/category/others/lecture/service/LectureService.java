package kr.or.ddit.category.others.lecture.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.category.others.culture.model.CultureVo;
import kr.or.ddit.category.others.lecture.dao.ILectureDao;
import kr.or.ddit.category.others.lecture.model.LectureVo;
import kr.or.ddit.page.model.LPageVo;
import kr.or.ddit.page.model.PageVo;

@Service
public class LectureService implements ILectureService {
	@Resource(name = "lectureDao")
	private ILectureDao lectureDao;

	@Override
	public List<LectureVo> getLectureList() {
		return lectureDao.getLectureList();
	}
	@Override
	public List<LectureVo> getLectureAllList() {
		return lectureDao.getLectureAllList();
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

	@Override
	public List<CultureVo> getCultureList() {
		return lectureDao.getCultureList();
	}
	
	
	
	@Override
	public Map<String, Object> AlllecturePagingList(PageVo pageVo) {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("AlllectureList", lectureDao.AlllecturePagingList(pageVo));
		
		int AlllectureCnt = lectureDao.AllLectureCnt();
		int paginationSize = (int) Math.ceil((double)AlllectureCnt/pageVo.getPageSize());
		resultMap.put("lastpaginationSize", paginationSize);
		
		return resultMap;
	}
	
	
	@Override
	public Map<String, Object> lecturePagingList(LPageVo pageVo) {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("lectureList", lectureDao.lecturePagingList(pageVo));
		
		int lectureCnt = lectureDao.lectureCnt(pageVo);
		int paginationSize = (int) Math.ceil((double)lectureCnt/pageVo.getPageSize());
		resultMap.put("lastpaginationSize", paginationSize);
		
		return resultMap;
	}
	
}
