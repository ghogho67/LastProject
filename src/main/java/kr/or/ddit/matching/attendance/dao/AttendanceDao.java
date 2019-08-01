package kr.or.ddit.matching.attendance.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.matching.attendance.model.AttendanceVo;

@Repository
public class AttendanceDao implements IAttendanceDao {
	
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
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
		return sqlSession.selectList("attendance.attendanceList",mat_id);
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
		return sqlSession.selectOne("attendance.checkLogin", check);
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
		return sqlSession.insert("attendance.checkIn", mat_id);
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
		return sqlSession.update("attendance.checkOut", checkOut);
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
		return sqlSession.delete("attendance.attendanceDelete");
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
		return sqlSession.selectOne("attendance.checkInCheck",mat_id);
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
		return sqlSession.selectOne("attendance.attendanceAdIdCnt",mat_id);
	}
}
