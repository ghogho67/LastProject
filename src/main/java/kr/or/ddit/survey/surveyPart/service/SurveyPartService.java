package kr.or.ddit.survey.surveyPart.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.member.careWorker.serviceType.service.IServiceTypeService;
import kr.or.ddit.survey.surveyPart.dao.ISurveyPartDao;

@Service
public class SurveyPartService implements IServiceTypeService {

	@Resource(name = "surveyPartDao")
	private ISurveyPartDao surveyPartDao;
}
