package kr.or.ddit.survey.service.question;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.survey.dao.question.IQuestionDao;


@Service
public class QuestionService implements IQuestionService{
	@Resource(name = "questionDao")
	private IQuestionDao questionDao;

}
