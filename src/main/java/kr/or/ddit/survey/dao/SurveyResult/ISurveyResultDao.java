package kr.or.ddit.survey.dao.SurveyResult;

import java.util.List;

import kr.or.ddit.survey.model.SurveyPartVo;
import kr.or.ddit.survey.model.SurveyResultVo;

public interface ISurveyResultDao {
	
	
	int InsertTestResult(SurveyResultVo SurveyResultVo);
	
	List<SurveyResultVo> getTestResult(String mem_id);
	
	List<SurveyResultVo> getCertainTestResult(SurveyPartVo SurveyPartVo);
}
