package kr.or.ddit.matching.report.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.or.ddit.joinVo.MatchingReportAttachmentVo;
import kr.or.ddit.joinVo.MatchingReportVo;
import kr.or.ddit.matching.report.model.ReportVo;
import kr.or.ddit.matching.report.model.ReportWriteVo;

@Repository
public class ReportDao implements IReportDao {
	
	private static final Logger logger = LoggerFactory.getLogger(ReportDao.class);
	
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
	
	
	

	@Override
	public List<ReportVo> getReportList(String mat_id) {
		return sqlSession.selectList("matchingReport.getMatchingList",mat_id);
	}



//	@Override
//	public ReportVo getReport(String rep_id) {
//		return sqlSession.selectOne("matchingReport.getMatching",rep_id);
//	}



	@Override
	public List<MatchingReportVo> getAllReportList(String mem_id) {
		return sqlSession.selectList("matchingReport.getAllReportList",mem_id);
	}



	@Override
	public MatchingReportAttachmentVo getCertainReportWA (MatchingReportAttachmentVo matchingReportAttachmentVo) {
		return sqlSession.selectOne("matchingReport.getCertainReportWA",matchingReportAttachmentVo);
	}



	@Override
	public MatchingReportVo getCertainReport(MatchingReportVo matchingReportVo) {
		return sqlSession.selectOne("matchingReport.getCertainReport",matchingReportVo);
	}
	

	@Override
	public List<MatchingReportVo> getWorkerReportList(String cw_mem_id) {
		return sqlSession.selectList("matchingReport.getWorkerReportList",cw_mem_id);
	}

	@Override
	public MatchingReportAttachmentVo getWorkerCertainReportWA(MatchingReportAttachmentVo matchingReportAttachmentVo) {
		return sqlSession.selectOne("matchingReport.getWorkerCertainReportWA",matchingReportAttachmentVo);
	}

	@Override
	public int reportInsert(ReportWriteVo rwv) {
		return sqlSession.insert("report.insert", rwv);
	}

	
	@Override
	public ReportVo getReportVo(int mat_id) {
		
		return sqlSession.selectOne("report.getReportVo",mat_id);

	}

	@Override
	public ReportVo getLatestReport() {
		
		return sqlSession.selectOne("report.getLatestReport");
		
	}



	@Override
	public int reportWrite(ReportVo reportVo) {
		logger.debug("☞reportVo:{}",reportVo);
		return sqlSession.insert("report.reportWrite",reportVo);
	}



//	@Override
//	public ReportVo getReport(int rep_id) {
//		
//		return sqlSession.selectOne("report.getReport",rep_id);
//	}
	

}








