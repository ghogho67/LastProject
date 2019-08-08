package kr.or.ddit.memberDisease.service;

import static org.junit.Assert.assertEquals;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.member.memberDisease.model.MemberDiseaseVo;
import kr.or.ddit.member.memberDisease.service.IMemberDiseaseService;
import kr.or.ddit.testenv.LogicTestEnv;

public class MemberDiseaseServiceTest extends LogicTestEnv {

	private static final Logger logger = LoggerFactory.getLogger(MemberDiseaseServiceTest.class);

	@Resource(name = "memberDiseaseService")
	private IMemberDiseaseService memberDiseaseService;

	@Test
	public void getMemberDiseaseVoServiceTest() {
		/*** Given ***/
		String mem_id = "brown";
		/*** When ***/
		List<MemberDiseaseVo> mdList = memberDiseaseService.getMemDisList(mem_id);

		/*** Then ***/
		assertEquals(5, mdList.size());
	}

}
