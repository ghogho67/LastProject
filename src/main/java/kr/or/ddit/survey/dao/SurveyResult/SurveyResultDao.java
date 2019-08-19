package kr.or.ddit.survey.dao.SurveyResult;

import java.util.List;

import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.survey.model.SurveyResultVo;


@Repository
public class SurveyResultDao implements ISurveyResultDao{

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	

	@Override
	public int InsertTestResult(SurveyResultVo SurveyResultVo) {
		return sqlSession.insert("survey.InsertTestResult",SurveyResultVo);
	}



	@Override
	public List<SurveyResultVo> getTestResult(String mem_id) {
		return sqlSession.selectList("survey.InsertTestResult",mem_id);
	}
	
}
