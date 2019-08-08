package kr.or.ddit.memberDisease.dao;

import static org.junit.Assert.assertEquals;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.member.memberDisease.dao.IMemberDiseaseDao;
import kr.or.ddit.member.memberDisease.model.MemberDiseaseVo;
import kr.or.ddit.testenv.LogicTestEnv;

public class MemberDiseaseDaoTest extends LogicTestEnv {
	private static final Logger logger = LoggerFactory.getLogger(MemberDiseaseDaoTest.class);
	@Resource(name = "memberDiseaseDao")
	private IMemberDiseaseDao memberDiseaseDao;

	@Test
	public void getMemberDiseaseVoDaoTest() {
		/*** Given ***/
		String mem_id = "brown";
		/*** When ***/
		List<MemberDiseaseVo> mdList = memberDiseaseDao.getMemDisList(mem_id);

		/*** Then ***/
		assertEquals(5, mdList.size());
	}

}
