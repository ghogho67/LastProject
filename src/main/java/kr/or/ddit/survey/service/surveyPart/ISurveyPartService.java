package kr.or.ddit.survey.service.surveyPart;

import kr.or.ddit.survey.model.SurveyPartVo;

public interface ISurveyPartService {

	int  InsertSurveyPartInfo(SurveyPartVo surveypartVo);
	
	SurveyPartVo getlatestSurveyPartInfo();



	int  checkScore(SurveyPartVo surveypartVo);

	
	
}
