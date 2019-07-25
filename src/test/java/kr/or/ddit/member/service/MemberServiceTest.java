package kr.or.ddit.member.service;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.member.member.service.IMemberService;
import kr.or.ddit.testenv.LogicTestEnv;

public class MemberServiceTest extends LogicTestEnv{

	@Resource(name = "memberService")
	private IMemberService memberService;
	
	@Test
	public void getMemList() {
		/***Given***/
		 List<MemberVo> memList = memberService.getMemList();

		/***When***/
		 int a = memList.size();

		/***Then***/
		assertEquals(16, a);
	}

}
