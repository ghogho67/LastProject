package kr.or.ddit.matching.attendance.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.matching.attendance.dao.IAttendanceDao;
import kr.or.ddit.matching.attendance.model.AttendanceVo;

@Service
public class AttendanceService implements IAttendanceService {

	@Resource(name = "attendanceDao")
	private IAttendanceDao attendanceDao;
	
	/**
	* Method : attendanceList
	* 작성자 : PC21
	* 변경이력 :
	* @param mat_id
	* @return
	* Method 설명 : attendanceList 받아온다.
	*/
	@Override
	public List<AttendanceVo> attendanceList(int mat_id) {
		return attendanceDao.attendanceList(mat_id);
	}
	/**
	* Method : checkLogin
	* 작성자 : PC21
	* 변경이력 :
	* @param check
	* @return
	* Method 설명 : 회원 아이디와 , 요양보호사 아이디로 매칭 번호를 알아낸다.
	*/
	@Override
	public String checkLogin(Map<String, String> check) {
		return attendanceDao.checkLogin(check);
	}
	/**
	* Method : checkIn
	* 작성자 : PC21
	* 변경이력 :
	* @param mat_id
	* @return
	* Method 설명 : 출석 QR코드로 하기
	*/
	@Override
	public int checkIn(int mat_id) {
		return attendanceDao.checkIn(mat_id);
	}
	/**
	* Method : checkOut
	* 작성자 : PC21
	* 변경이력 :
	* @param mat_id
	* @return
	* Method 설명 : 퇴근 QR코드로 하기
	*/
	@Override
	public int checkOut(Map<String, Integer> checkOut) {
		return attendanceDao.checkOut(checkOut);
	}
	
	/**
	* Method : attendanceDelete
	* 작성자 : PC21
	* 변경이력 :
	* @return
	* Method 설명 : 테스트코드를 위한 삭제
	*/
	@Override
	public int attendanceDelete() {
		return attendanceDao.attendanceDelete();
	}
	
	/**
	* Method : checkInCheck
	* 작성자 : PC21
	* 변경이력 :
	* @param mat_id
	* @return
	* Method 설명 : 해당 매칭에 대한 출석을할때 오늘 한번 찍었는지 확인
	*/
	@Override
	public int checkInCheck(int mat_id) {
		return attendanceDao.checkInCheck(mat_id);
	}
	
	/**
	* Method : attendanceAdIdCnt
	* 작성자 : PC21
	* 변경이력 :
	* @param mat_id
	* @return
	* Method 설명 : 퇴근QR을 위한 id불러오기
	*/
	@Override
	public int attendanceAdIdCnt(int mat_id) {
		return attendanceDao.attendanceAdIdCnt(mat_id);
	}

	


}
