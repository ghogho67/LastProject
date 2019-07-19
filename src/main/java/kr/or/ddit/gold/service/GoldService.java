package kr.or.ddit.gold.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import kr.or.ddit.gold.dao.IGoldDao;

@Repository
public class GoldService implements IGoldService{
	
	@Resource(name = "goldDao")
	private IGoldDao goldDao;
	

}
