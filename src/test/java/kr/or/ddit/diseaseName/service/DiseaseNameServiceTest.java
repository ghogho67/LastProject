package kr.or.ddit.diseaseName.service;

import static org.junit.Assert.assertNotNull;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.member.diseaseName.service.IDiseaseNameService;
import kr.or.ddit.testenv.LogicTestEnv;

public class DiseaseNameServiceTest extends LogicTestEnv {

	@Resource(name = "diseaseNameService")
	private IDiseaseNameService diseaseNameService;

	@Test
	public void getDisNameServiceTest() {
		/*** Given ***/
		int dis_id = 1;
		/*** When ***/
		String disNm = diseaseNameService.getDisName(dis_id);
		/*** Then ***/
		assertNotNull("중풍", disNm);
	}

}
