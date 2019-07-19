package kr.or.ddit.culture.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.culture.dao.ICultureDao;

@Service
public class CultureService implements ICultureService {
	@Resource(name = "cultureDao")
	private ICultureDao cultureDao;
}
