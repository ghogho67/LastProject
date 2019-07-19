package kr.or.ddit.question.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.question.dao.IQuestionDao;

@Service
public class QuestionService implements IQuestionService{
	@Resource(name = "questionDao")
	private IQuestionDao questionDao;

}
