package kr.or.ddit.survey.service.SurveyResult;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.survey.dao.SurveyResult.ISurveyResultDao;
import kr.or.ddit.survey.model.SurveyResultVo;


@Service
public class SurveyResultService implements ISurveyResultService {

	@Resource(name = "surveyResultDao")
	private ISurveyResultDao surveyResultDao;


	@Override
	public int InsertTestResult(SurveyResultVo SurveyResultVo) {
		return surveyResultDao.InsertTestResult(SurveyResultVo);
	}


	@Override
	public List<SurveyResultVo> getTestResult(String mem_id) {
		return surveyResultDao.getTestResult(mem_id);
	}

	
}