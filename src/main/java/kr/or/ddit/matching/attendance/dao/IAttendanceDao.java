package kr.or.ddit.matching.attendance.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.joinVo.AttendanceMatchingVo;
import kr.or.ddit.matching.attendance.model.AttendanceVo;
import kr.or.ddit.matching.matching.model.MatchingVo;
import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.page.model.PageVo;

public interface IAttendanceDao {
	
	/**
	* Method : attendanceList
	* 작성자 : PC21
	* 변경이력 :
	* @param mat_id
	* @return
	* Method 설명 : attendanceList 받아온다.
	*/
	public List<AttendanceVo> attendanceList(int mat_id); 
	
	/**
	* Method : checkLogin
	* 작성자 : PC21
	* 변경이력 :
	* @param check
	* @return
	* Method 설명 : 회원 아이디와 , 요양보호사 아이디로 매칭 번호를 알아낸다.
	*/
	public MatchingVo checkLogin(Map<String, String> check); 
	
	
	/**
	* Method : checkIn
	* 작성자 : PC21
	* 변경이력 :
	* @param mat_id
	* @return
	* Method 설명 : 출석 QR코드로 하기
	*/
	public int checkIn(int mat_id);
	
	/**
	* Method : checkOut
	* 작성자 : PC21
	* 변경이력 :
	* @param mat_id
	* @return
	* Method 설명 : 퇴근 QR코드로 하기
	*/
	public int checkOut(Map<String, Integer> checkOut);
	
	/**
	* Method : attendanceDelete
	* 작성자 : PC21
	* 변경이력 :
	* @return
	* Method 설명 : 테스트코드를 위한 삭제
	*/
	public int attendanceDelete();
	
	
	/**
	* Method : checkInCheck
	* 작성자 : PC21
	* 변경이력 :
	* @param mat_id
	* @return
	* Method 설명 : 해당 매칭에 대한 출석을할때 오늘 한번 찍었는지 확인
	*/
	public int checkInCheck(int mat_id); 
	
	/**
	* Method : attendanceAdIdCnt
	* 작성자 : PC21
	* 변경이력 :
	* @param mat_id
	* @return
	* Method 설명 : 퇴근QR을 위한 id불러오기
	*/
	public int attendanceAdIdCnt(int mat_id);
	
	/**
	* Method : cwMatchingList
	* 작성자 : PC21
	* 변경이력 :
	* @param cw_mem_id
	* @return
	* Method 설명 : 요양보호사의 매칭 이력 리스트 갖고오기
	*/
	public List<AttendanceMatchingVo> cwMatchingList(Map<String, Object> resultMap);
	
	
	/**
	* Method : cwMatchingCnt
	* 작성자 : PC21
	* 변경이력 :
	* @return
	* Method 설명 : 요양보호사의 매칭 건수를 갖고온다.
	*/
	public int cwMatchingCnt(String cw_mem_id);
	
	
	
	//============================================================================
	/**
	* Method : mattchingCnt
	* 작성자 : PC21
	* 변경이력 :
	* @param mat_id
	* @return
	* Method 설명 : 요양사아이디 날짜 검색에 따른 갯수를 갖고온다.
	*/
	public int daySaerchCnt(Map<String, Object> day);
	public List<AttendanceMatchingVo> daySaerchList(Map<String, Object> resultMap);
	
	/**
	* Method : memidSaerchCnt
	* 작성자 : PC21
	* 변경이력 :
	* @param memid
	* @return
	* Method 설명 : 요양사 아이디 , 회원아이디 검색에 따른 갯수 갖고온다.
	*/
	public int memidSaerchCnt(Map<String, Object> memid);

	public List<AttendanceMatchingVo> memidSaerchList(Map<String, Object> resultMap);

	

	
	//============================================================================
	
	
	public List<AttendanceMatchingVo> adminCheckList(PageVo pageVo);
	
	public int adminCheckCnt();
	
	public List<AttendanceMatchingVo> adminMemShearch(Map<String, Object> map);
	public int adminMemSearchCnt(String memid);
	
	public List<AttendanceMatchingVo> adminDaySearch(Map<String, Object> map);
	public int adminDaySearchCnt(String day);
	
	public MemberVo getNames(int mat_id);
	
	
	
	
	
	
	
	
	
	
}
