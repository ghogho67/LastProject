package kr.or.ddit.register.service;

import static org.junit.Assert.assertEquals;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.member.memberDisease.model.MemberDiseaseVo;
import kr.or.ddit.testenv.LogicTestEnv;

public class RegisterServiceTest extends LogicTestEnv{

	@Resource(name="registerService")
	private IRegisterService registerService;
	
	@Test
	public void insertMemberTest() {
		/***Given***/
		MemberVo memberVo = null;
		memberVo = new MemberVo("as12@", "강감찬", "82/01/01", "F", "asd12@1234", "010-1234-5678", "대전", "중구", "12345", "asd@daum.net", "1", "N", "o", "o", "부", "강강참", "010-1234-5678");
		/***When***/
		int insertCnt = registerService.insertMember(memberVo);
		
		/***Then***/
		assertEquals(1, insertCnt);

	}
	
	@Test
	public void insertMemberDiseaseTest() {
		/***Given***/
		MemberDiseaseVo memberDiseaseVo = null;
		memberDiseaseVo = new MemberDiseaseVo(10,"as12@", 2);
		/***When***/
		int insertCnt = registerService.insertMemberDisease(memberDiseaseVo);
		/***Then***/
		assertEquals(1, insertCnt);

	}
	

}
