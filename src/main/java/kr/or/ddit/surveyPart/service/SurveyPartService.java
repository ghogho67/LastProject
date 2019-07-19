package kr.or.ddit.surveyPart.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.serviceType.service.IServiceTypeService;
import kr.or.ddit.surveyPart.dao.ISurveyPartDao;

@Service
public class SurveyPartService implements IServiceTypeService {

	@Resource(name = "surveyPartDao")
	private ISurveyPartDao surveyPartDao;
}
