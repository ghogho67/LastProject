package kr.or.ddit.matching.reportAttach.service;

import java.util.List;

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
	
	@Override
	public List<ReportAttachVo> getReportAttachList(int mat_id) {
		return reportAttachDao.getReportAttachList(mat_id);
	}

	@Override
	public int reportAttachInsert(ReportAttachVo reportAttachVo) {
		return reportAttachDao.reportAttachInsert(reportAttachVo);
	}

	@Override
	public int reportAttachDelete(int rep_att_id) {
		return reportAttachDao.reportAttachDelete(rep_att_id);
	}

	@Override
	public ReportAttachVo getReportAttach(int rep_att_id) {
		return reportAttachDao.getReportAttach(rep_att_id);
	}

	
	
}
