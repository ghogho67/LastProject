package kr.or.ddit.gold.cardiac.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.gold.cardiac.dao.ICardiacDao;

@Service
public class CardiacService implements ICardiacService{
	
	@Resource(name = "cardiacDao")
	private ICardiacDao cardiacDao;
}
