package kr.or.ddit.register.dao;

import static org.junit.Assert.assertEquals;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.testenv.LogicTestEnv;

public class RegisterDaoTest extends LogicTestEnv{

	@Resource(name="registerDao")
	private IRegisterDao registerDao;
	
	
	@Test
	public void insertMemberTest() {
		/***Given***/
		MemberVo memberVo = null;
		memberVo = new MemberVo("asd12@", "강감찬", "82/01/01", "F", "asd12@1234", "010-1234-5678", "대전", "중구", "12345", "asd@daum.net", "1", "N", "o", "o", "부", "강강참", "010-1234-5678");
		/***When***/
		int insertCnt = registerDao.insertMember(memberVo);
		
		/***Then***/
		assertEquals(1, insertCnt);

	}
	
	@Test
	public void insertMemberDiseaseTest() {
		/***Given***/

		/***When***/

		/***Then***/

	}

}
