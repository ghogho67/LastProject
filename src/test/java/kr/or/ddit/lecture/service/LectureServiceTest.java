package kr.or.ddit.lecture.service;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.category.others.culture.model.CultureVo;
import kr.or.ddit.category.others.lecture.dao.ILectureDao;
import kr.or.ddit.category.others.lecture.model.LectureVo;
import kr.or.ddit.category.others.lecture.service.ILectureService;
import kr.or.ddit.page.model.LPageVo;
import kr.or.ddit.page.model.PageVo;
import kr.or.ddit.testenv.LogicTestEnv;

public class LectureServiceTest extends LogicTestEnv{
	
	@Resource(name = "lectureService")
	private ILectureService lectureDao;


	
	
	
	
	
	
	
	

	
	
	


	@Test
	public void getLectureList() {

		/*** Given ***/

		/*** When ***/
		List<LectureVo> appList = lectureDao.getLectureList();

		/*** Then ***/
		assertEquals(18, appList.size());
	}

	
	
	@Test
	public void getLectureAllList() {

		/*** Given ***/

		/*** When ***/
		List<LectureVo> appList = lectureDao.getLectureAllList();

		/*** Then ***/
		assertEquals(19, appList.size());
	}
	
	
	
	
	@Test
	public void getCultureList() {

		/*** Given ***/

		/*** When ***/
		List<CultureVo> appList = lectureDao.getCultureList();

		/*** Then ***/
		assertEquals(11, appList.size());
	}

	
	@Test
	public void getLecture() {

		/*** Given ***/
		int lec_id = 25;

		/*** When ***/
	    LectureVo appList = lectureDao.getLecture(lec_id);

		/*** Then ***/
		assertEquals(25, appList.getLec_id());
	}
	
	
	@Test
	public void getCulture() {

		/*** Given ***/
		int culture_id = 10;

		/*** When ***/
		CultureVo appList = lectureDao.getCulture(culture_id);

		/*** Then ***/
		assertEquals(30020, appList.getCate_id());
	}
	
	
	
	
	@Test
	public void getCertainLectureList() {

		/*** Given ***/
		String lec_type = "605";

		/*** When ***/
	    List<LectureVo> appList = lectureDao.getCertainLectureList(lec_type);

		/*** Then ***/
		assertEquals(2, appList.size());
	}
	
	
	
	
	
	

	@Test
	public void LectuerSearchTeacher() {

		/*** Given ***/
		String lec_tea = "이";

		/*** When ***/
	    List<LectureVo> appList = lectureDao.LectuerSearchTeacher(lec_tea);

		/*** Then ***/
		assertEquals(3, appList.size());
	}
	
	
	
	

	@Test
	public void LectuerSearchTitle() {

		/*** Given ***/
		String lec_nm = "이";

		/*** When ***/
	    List<LectureVo> appList = lectureDao.LectuerSearchTitle(lec_nm);

		/*** Then ***/
		assertEquals(4, appList.size());
	}
	
	

}
