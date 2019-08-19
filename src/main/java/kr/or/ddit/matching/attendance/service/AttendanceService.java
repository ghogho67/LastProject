package kr.or.ddit.matching.attendance.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.ddit.joinVo.AttendanceMatchingVo;
import kr.or.ddit.matching.attendance.dao.IAttendanceDao;
import kr.or.ddit.matching.attendance.model.AttendanceVo;
import kr.or.ddit.matching.matching.model.MatchingVo;
import kr.or.ddit.page.model.PageVo;

@Service
public class AttendanceService implements IAttendanceService {
	
	private static final Logger logger = LoggerFactory.getLogger(AttendanceService.class);
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
	
	/**
	* Method : cwMatchingList
	* 작성자 : PC21
	* 변경이력 :
	* @param cw_mem_id
	* @return
	* Method 설명 : 요양보호사의 매칭 이력 리스트 갖고오기
	*/
	@Override
	public Map<String, Object> cwMatchingList(Map<String, Object> map) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("cwMatchingList", attendanceDao.cwMatchingList(map));
		String cw_mem_id = (String) map.get("cw_mem_id");
		int pageSize = (int)map.get("pageSize");
		
		int cwMatchingCnt = attendanceDao.cwMatchingCnt(cw_mem_id);
		int paginationSize = (int) Math.ceil((double)cwMatchingCnt/pageSize);
		resultMap.put("lastpaginationSize", paginationSize);
		
		
		return resultMap;
		
	}
	
	@Override
	public Map<String, Object> daySaerchList(Map<String, Object> day) {
		int pageSize = (int)day.get("pageSize");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("daySaerchList", attendanceDao.daySaerchList(day));
		
		Map<String, Object> dayCnt = new HashMap<String, Object>();
		dayCnt.put("cw_mem_id", day.get("cw_mem_id"));
		dayCnt.put("day", day.get("day"));
		int dayAllCnt = attendanceDao.daySaerchCnt(dayCnt);
		
		int paginationSize = (int) Math.ceil((double)dayAllCnt/pageSize);
		resultMap.put("lastpaginationSize", paginationSize);
		
		
		return resultMap;
	}
	
	
	@Override
	public Map<String, Object> memidSaerchList(Map<String, Object> memid) {
		int pageSize = (int)memid.get("pageSize");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("memidSaerchList", attendanceDao.memidSaerchList(memid));
		
		Map<String, Object> memCnt = new HashMap<String, Object>();
		memCnt.put("cw_mem_id", memid.get("cw_mem_id"));
		memCnt.put("mem_id", memid.get("mem_id"));
		int memAllCnt = attendanceDao.memidSaerchCnt(memCnt);
		
		int paginationSize = (int) Math.ceil((double)memAllCnt/pageSize);
		resultMap.put("lastpaginationSize", paginationSize);
		
		return resultMap;
	}
	
	
	
	@Override
	public Map<String, Object> adminCheckList(PageVo pageVo) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("adminCheckList", attendanceDao.adminCheckList(pageVo));
		int pageSize = pageVo.getPageSize();
		
		int checkCnt = attendanceDao.adminCheckCnt();
		int paginationSize = (int) Math.ceil((double)checkCnt/pageSize);
		resultMap.put("lastpaginationSize", paginationSize);
		
		return resultMap;
	}
	
	
	
	
	@Override
	public Map<String, Object> adminMemShearch(Map<String, Object> map) {
		int pageSize = (int) map.get("pageSize");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("adminMemSaerch", attendanceDao.adminMemShearch(map));
		
		String memid = (String) map.get("mem_id");
		int checkCnt =  attendanceDao.adminMemSearchCnt(memid);
		int paginationSize = (int) Math.ceil((double)checkCnt/pageSize);
		resultMap.put("lastpaginationSize", paginationSize);
		return resultMap;
	}
	
	
	
	
	@Override
	public Map<String, Object> adminDaySearch(Map<String, Object> map) {
		int pageSize = (int) map.get("pageSize");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("adminDaySaerch", attendanceDao.adminDaySearch(map));
		String day = (String) map.get("day");
		int checkCnt =  attendanceDao.adminDaySearchCnt(day);
		int paginationSize = (int) Math.ceil((double)checkCnt/pageSize);
		resultMap.put("lastpaginationSize", paginationSize);
		return resultMap;
	}


}
