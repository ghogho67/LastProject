package kr.or.ddit.survey.dao.surveyPart;

import kr.or.ddit.survey.model.SurveyPartVo;

public interface ISurveyPartDao {
	

	int  InsertSurveyPartInfo(SurveyPartVo surveypartVo);
	
	SurveyPartVo getlatestSurveyPartInfo();


	int  checkScore(SurveyPartVo surveypartVo);
	
	
}
