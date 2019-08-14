package kr.or.ddit.category.others.culture.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.category.others.culture.dao.ICultureDao;
import kr.or.ddit.category.others.culture.model.CultureVo;

@Service
public class CultureService implements ICultureService {
	@Resource(name = "cultureDao")
	private ICultureDao cultureDao;

	@Override
	public int InsertCulture(CultureVo cultureVo) {
		// TODO Auto-generated method stub
		return cultureDao.InsertCulture(cultureVo);
	}
}
