package kr.or.ddit.grade.dao;

import static org.junit.Assert.assertEquals;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.matching.grade.dao.IGradeDao;
import kr.or.ddit.testenv.LogicTestEnv;

public class GradeDaoTest extends LogicTestEnv{
	
	@Resource(name = "gradeDao")
	private IGradeDao gradeDao;
	
	@Test
	public void cwGradeAvgTest() {
		/***Given***/
		String mem_id = "ahri";

		/***When***/
		String cwgrade = gradeDao.cwGradeAvg(mem_id);

		/***Then***/
		assertEquals("3", cwgrade);
	}

}
