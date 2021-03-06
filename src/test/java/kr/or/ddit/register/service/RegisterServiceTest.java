package kr.or.ddit.register.service;

import static org.junit.Assert.assertEquals;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.member.careWorker.career.model.CareerVo;
import kr.or.ddit.member.careWorker.day.model.DayVo;
import kr.or.ddit.member.careWorker.hospital.model.HospitalVo;
import kr.or.ddit.member.careWorker.location.model.LocationVo;
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
	
	//----------------------------------------------------
	
	@Test
	public void insertCwMemberTest() {
		/***Given***/
		MemberVo memberVo = null;
		memberVo = new MemberVo("asdf123!", "강감찬", "2019-07-07", "F", "asdf1234!@#", "010-7894-4563", "대전", "유성구", "1234", "asd@daum.net", "3", "N", "o", "o", "유", "1234");
		
		/***When***/
		int insertCnt = registerService.insertCWMember(memberVo);
		
		/***Then***/
		assertEquals(1, insertCnt);

	}
	
	@Test
	public void insertDayTest() {
		/***Given***/
		DayVo dayVo = new DayVo("aha", 1);
		/***When***/
		int insertCnt = registerService.insertDay(dayVo);
		/***Then***/
		assertEquals(1, insertCnt);
	}
	

	
	@Test
	public void insertLocationTest() {
		/***Given***/
		LocationVo locationVo = null;
		locationVo = new LocationVo(11, "aha", "대흥동");
				
		/***When***/
		int insertCnt = registerService.insertLocation(locationVo);

		/***Then***/
		assertEquals(1, insertCnt);
		
	}
	
	@Test
	public void insertHospitalTest() {
		/***Given***/
		HospitalVo hospitalVo = null;
		hospitalVo = new HospitalVo(15, "동내병원", "대전", "010-1236-4587");
		/***When***/
		int insertCnt = registerService.insertHospital(hospitalVo);

		/***Then***/
		assertEquals(1, insertCnt);

		
	}
	
	
	
	@Test
	public void insertCareerTest() throws ParseException {
		/***Given***/
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		CareerVo careerVo = new CareerVo(12, "커리어", "2019-01-01", "2019-05-05", "brown", 5);
//
//		/***When***/
//		int insertCnt = registerService.insertCareer(careerVo);
//
//		/***Then***/
//		assertEquals(1, insertCnt);

	}
	
	@Test
	public void idCheckTest() throws ParseException {
		/***Given***/
		String mem_id = "brown";

		/***When***/
		int insertCnt = registerService.idCheck(mem_id);

		/***Then***/
		assertEquals(1, insertCnt);

	}
	
	
	
	
	

}
