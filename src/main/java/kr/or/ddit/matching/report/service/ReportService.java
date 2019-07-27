package kr.or.ddit.matching.report.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.joinVo.MatchingReportAttachmentVo;
import kr.or.ddit.joinVo.MatchingReportVo;
import kr.or.ddit.matching.report.dao.IReportDao;
import kr.or.ddit.matching.report.model.ReportVo;

@Service
public class ReportService implements IReportService {

	@Resource(name = "reportDao")
	private IReportDao reportDao;

	@Override
	public List<ReportVo> getReportList(String mat_id) {
		return reportDao.getReportList(mat_id);
	}

	@Override
	public ReportVo getReport(String rep_id) {
		return reportDao.getReport(rep_id);
	}

	
	
	
	
	
	
	
	
	@Override
	public List<MatchingReportVo> getAllReportList(String mem_id) {
		return reportDao.getAllReportList(mem_id);
	}

	@Override
	public MatchingReportAttachmentVo getCertainReportWA(MatchingReportAttachmentVo matchingReportAttachmentVo) {
		return reportDao.getCertainReportWA(matchingReportAttachmentVo);
	}



	
	@Override
	public List<MatchingReportVo> getWorkerReportList(String cw_mem_id) {
		return reportDao.getWorkerReportList(cw_mem_id);
	}

	@Override
	public MatchingReportAttachmentVo getWorkerCertainReportWA(MatchingReportAttachmentVo matchingReportAttachmentVo) {
		return reportDao.getWorkerCertainReportWA(matchingReportAttachmentVo);
	}

}
