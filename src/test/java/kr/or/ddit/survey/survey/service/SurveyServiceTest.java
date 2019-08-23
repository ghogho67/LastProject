package kr.or.ddit.survey.survey.service;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.survey.dao.SurveyResult.ISurveyResultDao;
import kr.or.ddit.survey.dao.question.IQuestionDao;
import kr.or.ddit.survey.dao.surveyPart.ISurveyPartDao;
import kr.or.ddit.survey.dao.video.IVideoDao;
import kr.or.ddit.survey.model.QuestionChoiceVo;
import kr.or.ddit.survey.model.QuestionVo;
import kr.or.ddit.survey.model.SurveyPartVo;
import kr.or.ddit.survey.model.VideoVo;
import kr.or.ddit.survey.service.SurveyResult.ISurveyResultService;
import kr.or.ddit.survey.service.question.IQuestionService;
import kr.or.ddit.survey.service.surveyPart.ISurveyPartService;
import kr.or.ddit.survey.service.video.IVideoService;
import kr.or.ddit.testenv.LogicTestEnv;

public class SurveyServiceTest extends LogicTestEnv{

	@Resource(name = "questionService")
	private IQuestionService questionDao;
	
	@Resource(name = "surveyPartService")
	private ISurveyPartService surveyPartDao;

	
	@Resource(name = "surveyResultService")
	private ISurveyResultService surveyResultDao;

	
	@Resource(name = "videoService")
	private IVideoService videoDao;

	
	
	
	//인지향상 프로그램 통합테스트
	
	
	
	//비디오
	
	
//	@Test
//	public void getCertainLectureList() {
//
//		/*** Given ***/
//		int sur_id = 901;
//
//		/*** When ***/
//		VideoVo appList = videoDao.getVideo(sur_id);
//
//		/*** Then ***/
//		assertEquals(2, appList.getVideo_id());
//	}
//	
	
	
	

	@Test
	public void getLectureList() {

		/*** Given ***/

		/*** When ***/
		List<VideoVo> appList = videoDao.getAllVideos();

		/*** Then ***/
		assertEquals(6, appList.size());
	}

	
	
	
	

//	@Test
//	public void getTestResult() {
//
//		/*** Given ***/
//		String mem_id="dkskqk00";
//		/*** When ***/
//		List<SurveyResultVo> appList = surveyResultDao.getTestResult(mem_id);
//
//		/*** Then ***/
//		assertEquals(18, appList.size());
//	}
//
//	
//	
//	
	
//
//	@Test
//	public void getCertainTestResult() {
//
//		/*** Given ***/
//		
//		SurveyPartVo SurveyPartVo = new SurveyPartVo(901, "sona");
//
//		/*** When ***/
//		List<SurveyResultVo> appList = surveyResultDao.getCertainTestResult(SurveyPartVo);
//
//		/*** Then ***/
//		assertEquals(18, appList.size());
//	}
//
//	
//	

	@Test
	public void getlatestSurveyPartInfo() {

		/*** Given ***/
		

		/*** When ***/
		SurveyPartVo appList = surveyPartDao.getlatestSurveyPartInfo();

		/*** Then ***/
		assertEquals("brown", appList.getMem_id());
	}
	
	
	
	@Test
	public void getQuestions() {

		/*** Given ***/
		int sur_id = 901;
		/*** When ***/
		List<QuestionVo> appList = questionDao.getQuestions(sur_id);

		/*** Then ***/
		assertEquals(5, appList.size());
	}

	
	
	
	@Test
	public void getQuestionsAndChoices() {

		/*** Given ***/
		int sur_id = 901;
		/*** When ***/
		List<QuestionChoiceVo> appList = questionDao.getQuestionsAndChoices(sur_id);

		/*** Then ***/
		assertEquals(0, appList.size());
	}

	
	
	

}
