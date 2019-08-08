package kr.or.ddit.diseaseName.dao;

import static org.junit.Assert.assertNotNull;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.member.diseaseName.dao.IDiseaseNameDao;
import kr.or.ddit.testenv.LogicTestEnv;

public class DiseaseNameDaoTest extends LogicTestEnv {

	@Resource(name = "diseaseNameDao")
	private IDiseaseNameDao diseaseNameDao;

	@Test
	public void getDisNameDaoTest() {
		/*** Given ***/
		int dis_id = 1;
		/*** When ***/
		String disNm = diseaseNameDao.getDisName(dis_id);
		/*** Then ***/
		assertNotNull("중풍", disNm);
	}

}
