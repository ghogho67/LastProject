package kr.or.ddit.member.service;

import static org.junit.Assert.*;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.member.member.service.IMemberService;
import kr.or.ddit.page.model.PageVo;
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

	/**
	* Method : getMemberVoServiceTest
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 :회원 전체 페이징 리스트
	*/
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
	
	/**
	* Method : getAllMemberListTest
	* 작성자 : ADMIN
	* 변경이력 :
	* Method 설명 :회원 전체 페이징 리스트
	*/
	@Test
	public void getAllMemberListTest() {
		/***Given***/
		PageVo pageVo = new PageVo(1, 10);
		/***When***/
		Map<String, Object> resultMap = memberService.getAllMemberList(pageVo);
		List<MemberVo> memberList = (List<MemberVo>) resultMap.get("memberList");
		int paginationSize = (Integer) resultMap.get("paginationSize");
		/***Then***/
		assertEquals(10, memberList.size());

	}

}
