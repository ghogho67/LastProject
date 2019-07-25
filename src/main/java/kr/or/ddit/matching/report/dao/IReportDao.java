package kr.or.ddit.matching.report.dao;

import java.util.List;

import kr.or.ddit.joinVo.MatchingReportVo;
import kr.or.ddit.matching.report.model.ReportVo;


public interface IReportDao {

	
	
	
	List<ReportVo> getReportList(String mat_id);
	
	ReportVo getReport(String rep_id);
	
	
	
	List<MatchingReportVo> getAllReportList (String mem_id);
	MatchingReportVo getCertainReport (MatchingReportVo matchingReportVo);
	
}
