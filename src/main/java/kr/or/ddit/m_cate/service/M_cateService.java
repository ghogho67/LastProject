package kr.or.ddit.m_cate.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.m_cate.dao.IM_cateDao;

@Service
public class M_cateService implements IM_cateService {
	@Resource(name = "mcateDao")
	private IM_cateDao mcateDao;
	
}
