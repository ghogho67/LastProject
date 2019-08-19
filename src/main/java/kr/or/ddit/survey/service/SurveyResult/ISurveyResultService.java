package kr.or.ddit.survey.service.SurveyResult;

import java.util.List;

import kr.or.ddit.survey.model.SurveyResultVo;

public interface ISurveyResultService {
	int InsertTestResult(SurveyResultVo SurveyResultVo);
	List<SurveyResultVo> getTestResult(String mem_id);
	
	
}
