package kr.or.ddit.category.others.culture.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.category.others.culture.dao.ICultureDao;

@Service
public class CultureService implements ICultureService {
	@Resource(name = "cultureDao")
	private ICultureDao cultureDao;
}
