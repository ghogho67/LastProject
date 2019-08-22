package kr.or.ddit.matching.reportAttach.dao;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.matching.reportAttach.model.ReportAttachVo;
import kr.or.ddit.testenv.LogicTestEnv;

public class ReportAttachDaoTest extends LogicTestEnv {

	private static final Logger logger = LoggerFactory.getLogger(ReportAttachDaoTest.class);

	@Resource(name = "reportAttachDao")
	private IReportAttachDao reportAttachDao;

	@Test
	public void getReportAttachListDaoTest() {

		/*** Given ***/
		int mat_id = 10;
		/*** When ***/
		List<ReportAttachVo> ravl = reportAttachDao.getReportAttachList(mat_id);

		/*** Then ***/
		logger.debug("☞ravl:{}", ravl);
	}

}
