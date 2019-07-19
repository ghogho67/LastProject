package kr.or.ddit.survey.survey.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.survey.survey.dao.ISurveyDao;

@Service
public class SurveyService implements ISurveyService {

	@Resource(name = "surveyDao")
	private ISurveyDao surveyDao;
	
}
