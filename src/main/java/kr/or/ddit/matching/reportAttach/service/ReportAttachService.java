package kr.or.ddit.matching.reportAttach.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.matching.reportAttach.dao.IReportAttachDao;
import kr.or.ddit.matching.reportAttach.model.ReportAttachVo;

@Service
public class ReportAttachService implements IReportAttachService{
	@Resource(name = "reportAttachDao")
	private IReportAttachDao reportAttachDao;
	
	
	
	@Override
	public ReportAttachVo FileDown(int rep_att_id) {
		return reportAttachDao.FileDown(rep_att_id);
		
	}

	
	
}
