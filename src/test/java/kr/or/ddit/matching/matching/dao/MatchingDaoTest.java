package kr.or.ddit.matching.matching.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.matching.matching.model.MatchingVo;
import kr.or.ddit.testenv.LogicTestEnv;

public class MatchingDaoTest extends LogicTestEnv {
	private static final Logger logger = LoggerFactory.getLogger(MatchingDaoTest.class);
	@Resource(name = "matchingDao")
	private IMatchingDao matchingDao;

	@Test
	public void matchingDeleteDaoTest() {
		/*** Given ***/
		int mat_id = 1;
		/*** When ***/
		int deleteCnt = matchingDao.matchingDelete(mat_id);
		/*** Then ***/
		assertEquals(1, deleteCnt);
		assertNotNull(matchingDao);
	}

	@Test
	public void matchingGetMatchingVoDaoTest() {
		/*** Given ***/
		int mat_id = 1;
		/*** When ***/
		MatchingVo mvo = matchingDao.getMatchingVo(mat_id);
		/*** Then ***/
		assertEquals("매칭1", mvo.getMat_title());
	}

	@Test
	public void matchingCreateDaoTest() {
		
		/*** Given ***/
		MatchingVo mvo = new MatchingVo();
		mvo.setMat_title("a");
		mvo.setMat_cont("a");
		mvo.setMat_st("2019-08-05T16:04");
		mvo.setMat_end("2019-08-05T17:04");
		mvo.setMat_bc("#D25565");
		mvo.setMat_tc("#ffffff");
		mvo.setMat_allDay(false);
		mvo.setMat_type("방문간호");
		mvo.setMem_id("brown");
		mvo.setCw_mem_id("anni");
		mvo.setMat_del("N");
		/*** When ***/
		int createCnt = matchingDao.matchingCreate(mvo);
		/*** Then ***/
		assertEquals(1, createCnt);
	}

	@Test
	public void matchingModifyDaoTest() {
		/*** Given ***/
		MatchingVo mvo = new MatchingVo();
		mvo.setMat_id(1);
		mvo.setMat_title("a");
		mvo.setMat_cont("a");
		mvo.setMat_st("2019-08-05T16:04");
		mvo.setMat_end("2019-08-05T17:04");
		mvo.setMat_bc("#D25565");
		mvo.setMat_tc("#ffffff");
		mvo.setMat_allDay(false);
		mvo.setMat_type("방문간호");
		mvo.setMem_id("brown");
		/*** When ***/
		int updateCnt = matchingDao.matchingModify(mvo);
		/*** Then ***/
		assertEquals(1, updateCnt);
	}

	@Test
	public void getMatchingVoDaoTest() {

		/*** Given ***/
		int mat_id = 1;
		/*** When ***/
		MatchingVo mvo = matchingDao.getMatchingVo(mat_id);
		/*** Then ***/
		assertEquals("매칭1", mvo.getMat_title());

	}

	@Test
	public void getMatchingListDaoTest() {

		/*** Given ***/
		String mem_id = "brown";
		/*** When ***/
		List<MatchingVo> mList = (List<MatchingVo>) matchingDao.getMatchingList(mem_id);
		/*** Then ***/
		assertEquals("a", mList.get(0).getMat_title());

	}

}
