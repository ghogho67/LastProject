package kr.or.ddit.grade.service;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.matching.grade.dao.IGradeDao;
import kr.or.ddit.matching.grade.service.IGradeService;
import kr.or.ddit.testenv.LogicTestEnv;

public class GradeServiceTest extends LogicTestEnv{

	@Resource(name = "gradeService")
	private IGradeService gradeService;
	
	@Test
	public void cwGradeAvgTest() {
		/***Given***/
		String mem_id = "ahri";

		/***When***/
		String cwgrade = gradeService.cwGradeAvg(mem_id);

		/***Then***/
		assertEquals("3", cwgrade);
	}

}
