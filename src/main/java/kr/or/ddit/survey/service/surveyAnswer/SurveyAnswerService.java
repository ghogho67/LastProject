package kr.or.ddit.survey.service.surveyAnswer;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.survey.dao.surveyAnswer.ISurveyAnswerDao;
import kr.or.ddit.survey.model.SurveyAnswerVo;


@Service
public class SurveyAnswerService implements ISurveyAnswerService {

	@Resource(name = "surveyAnswerDao")
	private ISurveyAnswerDao surveyAnswerDao;

	@Override
	public int insertQuestionAns(SurveyAnswerVo surveyAnswerVo) {
		return surveyAnswerDao.insertQuestionAns(surveyAnswerVo);
	}

	
}