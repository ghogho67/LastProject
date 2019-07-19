package kr.or.ddit.survey.surveyAnswer.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.survey.surveyAnswer.dao.ISurveyAnswerDao;

@Service
public class SurveyAnswerService implements ISurveyAnswerService {

	@Resource(name = "surveyAnswerDao")
	private ISurveyAnswerDao surveyAnswerDao;
}
