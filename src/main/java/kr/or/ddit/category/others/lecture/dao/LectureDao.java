package kr.or.ddit.category.others.lecture.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.category.others.culture.model.CultureVo;
import kr.or.ddit.category.others.lecture.model.LectureVo;
import kr.or.ddit.page.model.LPageVo;
import kr.or.ddit.page.model.PageVo;

@Repository
public class LectureDao implements ILectureDao {
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	@Override
	public List<LectureVo> getLectureList() {

		return sqlSession.selectList("lecture.getLectureList");
	}
	@Override
	public List<LectureVo> getLectureAllList() {
		
		return sqlSession.selectList("lecture.getLectureAllList");
	}

	@Override
	public LectureVo getLecture(int lec_id) {
		return 	sqlSession.selectOne("lecture.getLecture",lec_id);
	}

	@Override
	public List<LectureVo> getCertainLectureList(String lec_type) {
		return sqlSession.selectList("lecture.getCertainLectureList",lec_type);
	}

	@Override
	public int deleteLecture(int lec_id) {
		return 	sqlSession.update("lecture.deleteLecture",lec_id);
	}

	@Override
	public int useLecture(int lec_id) {
		return 	sqlSession.update("lecture.useLecture",lec_id);
	}

	@Override
	public int updateLecture(LectureVo LectureVo) {
		return 	sqlSession.update("lecture.updateLecture",LectureVo);
	}

	@Override
	public int InsertLecture(LectureVo LectureVo) {
		return 	sqlSession.insert("lecture.InsertLecture",LectureVo);
	}

	@Override
	public CultureVo getCulture(int culture_id) {
		return 	sqlSession.selectOne("lecture.getCulture",culture_id);
	}

	@Override
	public List<CultureVo> getCultureList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("lecture.getCultureList");
	}
	@Override
	public List<LectureVo> AlllecturePagingList(PageVo pageVo) {
		return sqlSession.selectList("lecture.AlllecturePagingList",pageVo);
	}
	@Override
	public List<LectureVo> lecturePagingList(LPageVo pageVo) {
		return sqlSession.selectList("lecture.lecturePagingList", pageVo);
	}
	@Override
	public int AllLectureCnt() {
		return sqlSession.selectOne("lecture.AllLectureCnt");
	}
	@Override
	public int lectureCnt(LPageVo pageVo) {
		return sqlSession.selectOne("lecture.lectureCnt",pageVo);
	}
	
	
	
	@Override
	public List<LectureVo> LectuerSearchTitle(String lec_nm) {

		return sqlSession.selectList("lecture.LectuerSearchTitle",lec_nm);
	}
	
	@Override
	public List<LectureVo> LectuerSearchTeacher(String lec_tea) {
		
		return sqlSession.selectList("lecture.LectuerSearchTeacher",lec_tea);
	}
	@Override
	public int deleteCulture(int culture_id) {
		// TODO Auto-generated method stub
		return sqlSession.delete("lecture.deleteCulture",culture_id);
	}
	
}
