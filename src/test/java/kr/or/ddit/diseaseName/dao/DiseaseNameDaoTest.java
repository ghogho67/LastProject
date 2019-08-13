package kr.or.ddit.diseaseName.dao;

import static org.junit.Assert.assertNotNull;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.member.diseaseName.dao.IDiseaseNameDao;
import kr.or.ddit.testenv.LogicTestEnv;

public class DiseaseNameDaoTest extends LogicTestEnv {

	private static final Logger logger = LoggerFactory.getLogger(DiseaseNameDaoTest.class);

	@Resource(name = "diseaseNameDao")
	private IDiseaseNameDao diseaseNameDao;

	@Test
	public void getDisNameDaoTest() {
		/*** Given ***/
		int dis_id = 1;
		/*** When ***/
		String disNm = diseaseNameDao.getDisName(dis_id);
		logger.debug("☞disNm:{}", disNm);
		/*** Then ***/
		assertNotNull("중풍", disNm);
	}

}
