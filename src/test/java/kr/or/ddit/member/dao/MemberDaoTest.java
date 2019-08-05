package kr.or.ddit.member.dao;

import static org.junit.Assert.assertEquals;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.member.member.dao.IMemberDao;
import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.testenv.LogicTestEnv;

public class MemberDaoTest extends LogicTestEnv {

	private static final Logger logger = LoggerFactory.getLogger(MemberDaoTest.class);

	@Resource(name = "memberDao")
	private IMemberDao memberDao;

	@Test
	public void getMemList() {
		/*** Given ***/
		List<MemberVo> memList = memberDao.getMemList();

		/*** When ***/
		int a = memList.size();

		/*** Then ***/
		assertEquals(16, a);
	}

	// 요양보호사리스트 조회
	@Test
	public void getCwListDaoTest() {
		/*** Given ***/
		/*** When ***/
		List<MemberVo> mvol = memberDao.getCwList();
		/*** Then ***/
		logger.debug("☞mvol:{}", mvol);
	}

	@Test
	public void getMemberVoDaoTest() {
		/*** Given ***/
		String mem_id = "brown";
		/*** When ***/
		MemberVo memVo = memberDao.getMemVo(mem_id);
		/*** Then ***/
		logger.debug("☞memVo.getMem:{}",memVo.getMem_nm());
		assertEquals("브라운", memVo.getMem_nm());
	}

}
