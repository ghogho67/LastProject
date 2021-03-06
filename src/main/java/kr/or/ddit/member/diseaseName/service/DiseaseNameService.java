package kr.or.ddit.member.diseaseName.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.member.diseaseName.dao.IDiseaseNameDao;

@Service
public class DiseaseNameService implements IDiseaseNameService {

	@Resource(name = "diseaseNameDao")
	private IDiseaseNameDao diseaseNameDao;

	@Override
	public String getDisName(int dis_id) {
		return diseaseNameDao.getDisName(dis_id);
	}
}
