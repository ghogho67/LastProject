package kr.or.ddit.matching.attendance.dao;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.matching.attendance.model.AttendanceVo;
import kr.or.ddit.matching.matching.model.MatchingVo;
import kr.or.ddit.testenv.LogicTestEnv;

public class AttendanceDaoTest extends LogicTestEnv{
	
	@Resource(name = "attendanceDao")
	private IAttendanceDao attendanceDao;
	
	/**
	* Method : attendanceListTest
	* 작성자 : PC21
	* 변경이력 :
	* @param mat_id
	* @return
	* Method 설명 : attendanceList 받아온다.
	*/
	@Test
	public void attendanceListTest() {
		/***Given***/
		int mat_id  = 1;

		/***When***/
		List<AttendanceVo> test = attendanceDao.attendanceList(mat_id);

		/***Then***/
		
		assertEquals(1, test.size());
	}
	
	/**
	* Method : checkLoginTest
	* 작성자 : PC21
	* 변경이력 :
	* @param check
	* @return
	* Method 설명 : 회원 아이디와 , 요양보호사 아이디로 매칭 번호를 알아낸다.
	*/
	@Test
	public void checkLoginTest() {
		/***Given***/
		Map<String, String> check = new HashMap<String, String>();
		check.put("mem_id", "brown");
		check.put("cw_mem_id", "ahri");

		/***When***/
		String test = attendanceDao.checkLogin(check);
		/***Then***/
		
		assertEquals("1", test);
	}
	
	
	/**
	* Method : checkInTest
	* 작성자 : PC21
	* 변경이력 :
	* @param mat_id
	* @return
	* Method 설명 : 출석 QR코드로 하기
	*/
	@Test
	public void checkInTest() {
		/***Given***/
		int mat_id = 1;
		
		/***When***/
		int test = attendanceDao.checkIn(mat_id);
		/***Then***/
		assertEquals(1, test);
		
	}
	
	/**
	* Method : checkOutTest
	* 작성자 : PC21
	* 변경이력 :
	* @param mat_id
	* @return
	* Method 설명 : 퇴근 QR코드로 하기
	*/
	@Test
	public void checkOutTest() {
		/***Given***/
		Map<String, Integer> checkOut = new HashMap<String, Integer>();
		checkOut.put("mat_id", 1);
		checkOut.put("ad_id", 49);
		
		/***When***/
		int test = attendanceDao.checkOut(checkOut);
		/***Then***/
		assertEquals(1, test);
		
	}
	
	@Test
	public void checkInCheckTest() {
		/***Given***/
		int mat_id = 1;
		
		/***When***/
		int test = attendanceDao.checkInCheck(mat_id);
		/***Then***/
		assertEquals(1, test);
		
	}
	
	@Test
	public void attendanceAdIdCntTest() {
		/***Given***/
		int mat_id = 1;
		
		/***When***/
		int test = attendanceDao.attendanceAdIdCnt(mat_id);
		/***Then***/
		assertEquals(49, test);
		
	}
	
//	@Test
//	public void cwMatchingList() {
//		/***Given***/
//		String cw_mem_id = "yumi";
//		
//		/***When***/
//		List<MatchingVo> test = attendanceDao.cwMatchingList(cw_mem_id);
//		/***Then***/
//		assertEquals(1, test.size());
//		
//	}
	
	
	

}
