package kr.or.ddit.matching.attendance.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.matching.attendance.model.AttendanceVo;
import kr.or.ddit.matching.matching.model.MatchingVo;

public interface IAttendanceService {
	
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
	public String checkLogin(Map<String, String> check); 
	
	
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
	public List<MatchingVo> cwMatchingList(String cw_mem_id);

}
