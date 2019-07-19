package kr.or.ddit.matching.attendance.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class AttendanceService {

	@Resource(name = "attendanceService")
	private IAttendanceService attendanceService;
	
}
