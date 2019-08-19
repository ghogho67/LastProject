package kr.or.ddit.member.service;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.member.member.service.IMemberService;
import kr.or.ddit.testenv.LogicTestEnv;

public class MemberServiceTest extends LogicTestEnv {

	private static final Logger logger = LoggerFactory.getLogger(MemberServiceTest.class);

	@Resource(name = "memberService")
	private IMemberService memberService;

	@Test
	public void getMemList() {
		/*** Given ***/
		List<MemberVo> memList = memberService.getMemList();

		/*** When ***/
		int a = memList.size();

		/*** Then ***/
		assertEquals(16, a);
	}

	// 요양보호사리스트 조회
	@Test
	public void getCwListServiceTest() {
		/*** Given ***/
		/*** When ***/
		List<MemberVo> mvol = memberService.getCwList();
		/*** Then ***/
		logger.debug("☞mvol:{}", mvol);
		assertEquals(7, mvol.size());
	}

	@Test
	public void getMemberVoServiceTest() {
		/*** Given ***/
		String mem_id = "brown";
		/*** When ***/
		MemberVo memVo = memberService.getMemVo(mem_id);
		/*** Then ***/
		logger.debug("☞memVo.getMem:{}", memVo.getMem_nm());
		assertEquals("브라운", memVo.getMem_nm());
	}
	

}
