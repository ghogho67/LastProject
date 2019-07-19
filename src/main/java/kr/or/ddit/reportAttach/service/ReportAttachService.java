package kr.or.ddit.reportAttach.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.reportAttach.dao.IReportAttachDao;

@Service
public class ReportAttachService implements IReportAttachService{
	@Resource(name = "reportAttachDao")
	private IReportAttachDao reportAttachDao;
}
