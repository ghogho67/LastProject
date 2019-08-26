package kr.or.ddit.matching.report.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.category.post.post.model.PostVo;
import kr.or.ddit.joinVo.MatchingReportAttachmentVo;
import kr.or.ddit.joinVo.MatchingReportVo;
import kr.or.ddit.matching.report.dao.IReportDao;
import kr.or.ddit.matching.report.model.CoReportVo;
import kr.or.ddit.matching.report.model.ReportVo;
import kr.or.ddit.matching.report.model.ReportWriteVo;

@Service
public class ReportService implements IReportService {

	@Resource(name = "reportDao")
	private IReportDao reportDao;

	@Override
	public List<ReportVo> getReportList(String mat_id) {
		return reportDao.getReportList(mat_id);
	}

//	@Override
//	public ReportVo getReport(String rep_id) {
//		return reportDao.getReport(rep_id);
//	}

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

	@Override
	public int reportInsert(ReportWriteVo rwv) {
		return reportDao.reportInsert(rwv);
	}

	@Override
	public int coReportInsert(CoReportVo crv) {
		return reportDao.coReportInsert(crv);
	}

	@Override
	public ReportVo getReportVo(int mat_id) {
		return reportDao.getReportVo(mat_id);
	}

	@Override
	public int reportWrite(ReportVo reportVo) {
		return reportDao.reportWrite(reportVo);
	}

	@Override
	public ReportVo getLatestReport() {

		return reportDao.getLatestReport();

	}

	@Override
	public int reportModify(ReportVo reportVo) {
		return reportDao.reportModify(reportVo);
	}
//	@Override
//	public ReportVo getReport(int rep_id) {
//		
//		return reportDao.getReport(rep_id);
//	}

	@Override
	public CoReportVo getLatestCoReport() {
		// TODO Auto-generated method stub
		return reportDao.getLatestCoReport();
	}
}
