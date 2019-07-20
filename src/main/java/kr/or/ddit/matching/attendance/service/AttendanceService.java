package kr.or.ddit.matching.attendance.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.matching.attendance.dao.IAttendanceDao;

@Service
public class AttendanceService implements IAttendanceService {

	@Resource(name = "attendanceDao")
	private IAttendanceDao attendanceDao;
	
}
