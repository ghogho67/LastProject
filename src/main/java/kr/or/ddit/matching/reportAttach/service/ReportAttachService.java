package kr.or.ddit.matching.reportAttach.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.matching.reportAttach.dao.IReportAttachDao;

@Service
public class ReportAttachService implements IReportAttachService{
	@Resource(name = "reportAttachDao")
	private IReportAttachDao reportAttachDao;
}
