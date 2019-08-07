package kr.or.ddit.survey.dao.surveyPart;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.survey.model.SurveyPartVo;

@Repository
public class SurveyPartDao implements ISurveyPartDao {
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	@Override
	public int InsertSurveyPartInfo(SurveyPartVo surveypartVo) {
		return sqlSession.insert("survey.InsertSurveyPartInfo",surveypartVo);
	}

	@Override
	public SurveyPartVo getlatestSurveyPartInfo() {
		return sqlSession.selectOne("survey.getlatestSurveyPartInfo");
		}

	@Override
	public int checkScore(SurveyPartVo surveypartVo) {
		return sqlSession.selectOne("survey.checkScore",surveypartVo);
	}
	
}
