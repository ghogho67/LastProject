package kr.or.ddit.matching.report.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.matching.report.dao.IReportDao;
import kr.or.ddit.matching.reportAttach.service.IReportService;

@Service
public class ReportService implements IReportService {
	
	@Resource(name = "reportDao")
	private IReportDao reportDao;

}
