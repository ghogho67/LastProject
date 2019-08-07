package kr.or.ddit.survey.service.survey;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.survey.dao.survey.ISurveyDao;


@Service
public class SurveyService implements ISurveyService {

	@Resource(name = "surveyDao")
	private ISurveyDao surveyDao;
	
}
