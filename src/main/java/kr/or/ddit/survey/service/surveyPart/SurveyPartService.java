package kr.or.ddit.survey.service.surveyPart;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.member.careWorker.serviceType.service.IServiceTypeService;
import kr.or.ddit.survey.dao.surveyPart.ISurveyPartDao;
import kr.or.ddit.survey.model.SurveyPartVo;

@Service
public class SurveyPartService implements ISurveyPartService {

	@Resource(name = "surveyPartDao")
	private ISurveyPartDao surveyPartDao;

	@Override
	public int InsertSurveyPartInfo(SurveyPartVo surveypartVo) {
		return surveyPartDao.InsertSurveyPartInfo(surveypartVo);
	}

	@Override
	public SurveyPartVo getlatestSurveyPartInfo() {
		return surveyPartDao.getlatestSurveyPartInfo();
	}
	
	@Override
	public int checkScore(SurveyPartVo surveypartVo) {
		return surveyPartDao.checkScore(surveypartVo);
	}

	
}
