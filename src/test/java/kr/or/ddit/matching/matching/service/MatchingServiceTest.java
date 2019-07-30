package kr.or.ddit.matching.matching.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.matching.matching.model.MatchingVo;
import kr.or.ddit.testenv.LogicTestEnv;

public class MatchingServiceTest extends LogicTestEnv {

	private static final Logger logger = LoggerFactory.getLogger(MatchingServiceTest.class);

	@Resource(name = "matchingService")
	private IMatchingService matchingService;

	@Test
	public void matchingDeleteServiceTest() {
		/*** Given ***/
		int mat_id = 1;
		/*** When ***/
		int deleteCnt = matchingService.matchingDelete(mat_id);
		/*** Then ***/
		assertEquals(1, deleteCnt);
		assertNotNull(matchingService);
	}

	@Test
	public void matchingGetMatchingVoServiceTest() {
		/*** Given ***/
		int mat_id = 1;
		/*** When ***/
		MatchingVo mvo = matchingService.getMatchingVo(mat_id);
		/*** Then ***/
		assertEquals("매칭1", mvo.getMat_title());
	}

	@Test
	public void matchingCreateServiceTest() {
		/*** Given ***/
//			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
//			list:[{
//				title=sdgasdg, 
//				description=jhglglhl, 
//				startTime=18:41, 
//				endTime=19:41, 
//				startDate=2019-08-06, 
//				endDate=2019-09-05, 
//				dow=[1, 2, 3, 4, 5], 
//				type=운동도움, 
//				c_mem_id=사나, 
//				backgroundColor=#D25565, 
//				textColor=#ffffff, 
//				allDay=false, 
//				c_worker=오도아}]
//			Calendar cal = Calendar.getInstance();
//			logger.debug("☞cal:{}", cal);
//			cal.set(Calendar.YEAR, Integer.parseInt(((String) list.get(0).get("endDate")).substring(0, 4))); // 종료날짜셋팅
//			cal.set(Calendar.MONTH, Integer.parseInt(((String) list.get(0).get("endDate")).substring(5, 7)) - 1); // 종료날짜셋팅
//			cal.set(Calendar.DATE, Integer.parseInt(((String) list.get(0).get("endDate")).substring(8))); // 종료날짜셋팅
//			cal.set(Calendar.HOUR_OF_DAY, Integer.parseInt(((String) list.get(0).get("endTime")).substring(0, 2))); // 종료날짜셋팅
//			cal.set(Calendar.MINUTE, Integer.parseInt(((String) list.get(0).get("endTime")).substring(3))); // 종료 날짜 셋팅
		//
//			logger.debug("☞Integer.parseInt(((String) list.get(0).get(\"endDate\")).substring(0, 4)):{}",Integer.parseInt(((String) list.get(0).get("endDate")).substring(0, 4)));
//			MatchingVo mvo = new MatchingVo();
//			mvo.setMat_title("mat_title");
//			mvo.setMat_cont("mat_cont");
//			/*** When ***/
		//
//			/*** Then ***/
		String dow = "[1, 2, 3, 4, 5]";
		String[] items = dow.toString().replaceAll("\\[", "").replaceAll("\\]", "").replaceAll("\\s", "").split(",");
		for (String item : items)
			logger.debug("☞items:{}", item);
	}

	@Test
	public void matchingModifyServiceTest() {
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
		int updateCnt = matchingService.matchingModify(mvo);
		/*** Then ***/
		assertEquals(1, updateCnt);
	}

	@Test
	public void getMatchingVoServiceTest() {

		/*** Given ***/
		int mat_id = 1;
		/*** When ***/
		MatchingVo mvo = matchingService.getMatchingVo(mat_id);
		/*** Then ***/
		assertEquals("매칭1", mvo.getMat_title());

	}

	@Test
	public void getMatchingListServiceTest() {

		/*** Given ***/
		String mem_id = "brown";
		/*** When ***/
		List<MatchingVo> mList = (List<MatchingVo>) matchingService.getMatchingList(mem_id);
		/*** Then ***/
		assertEquals("a", mList.get(0).getMat_title());

	}

}
