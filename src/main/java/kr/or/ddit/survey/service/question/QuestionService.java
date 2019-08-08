package kr.or.ddit.survey.service.question;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.survey.dao.question.IQuestionDao;
import kr.or.ddit.survey.model.QuestionChoiceVo;
import kr.or.ddit.survey.model.QuestionVo;


@Service
public class QuestionService implements IQuestionService{
	@Resource(name = "questionDao")
	private IQuestionDao questionDao;

	@Override
	public List<QuestionVo> getQuestions(int sur_id) {
		return questionDao.getQuestions(sur_id);
	}

	@Override
	public List<QuestionChoiceVo> getQuestionsAndChoices(int sur_id) {
		return questionDao.getQuestionsAndChoices(sur_id);
	}

}
