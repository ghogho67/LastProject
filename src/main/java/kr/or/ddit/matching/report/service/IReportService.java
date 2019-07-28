package kr.or.ddit.matching.report.service;

import java.util.List;

import kr.or.ddit.joinVo.MatchingReportAttachmentVo;
import kr.or.ddit.joinVo.MatchingReportVo;
import kr.or.ddit.matching.report.model.ReportVo;

public interface IReportService {

	
List<ReportVo> getReportList(String mat_id);
	
	ReportVo getReport(String rep_id);

	

	List<MatchingReportVo> getAllReportList (String mem_id);
	
	//MatchingReportVo getCertainReport (MatchingReportVo matchingReportVo);
	
	MatchingReportAttachmentVo getCertainReportWA (MatchingReportAttachmentVo matchingReportAttachmentVo);

	List<MatchingReportVo> getWorkerReportList (String cw_mem_id);
	MatchingReportAttachmentVo getWorkerCertainReportWA (MatchingReportAttachmentVo matchingReportAttachmentVo);

}
