package kr.or.ddit.cardiac.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.cardiac.dao.ICardiacDao;

@Service
public class CardiacService implements ICardiacService{
	
	@Resource(name = "cardiacDao")
	private ICardiacDao cardiacDao;
}
