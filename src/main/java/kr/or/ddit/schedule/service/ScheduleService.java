package kr.or.ddit.schedule.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.schedule.dao.IScheduleDao;

@Service
public class ScheduleService implements IScheduleService{
	@Resource(name = "scheduleDao")
	private IScheduleDao scheduleDao;
}
