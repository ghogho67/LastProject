package kr.or.ddit.report.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.report.dao.IReportDao;

@Service
public class ReportService implements IReportService {
	
	@Resource(name = "reportDao")
	private IReportDao reportDao;

}
