package kr.or.ddit.matching.report.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.joinVo.MatchingReportAttachmentVo;
import kr.or.ddit.joinVo.MatchingReportVo;
import kr.or.ddit.matching.report.model.ReportVo;

@Repository
public class ReportDao implements IReportDao {
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
	
	
	

	@Override
	public List<ReportVo> getReportList(String mat_id) {
		return sqlSession.selectList("matchingReport.getMatchingList",mat_id);
	}



	@Override
	public ReportVo getReport(String rep_id) {
		return sqlSession.selectOne("matchingReport.getMatching",rep_id);
	}



	@Override
	public List<MatchingReportVo> getAllReportList(String mem_id) {
		return sqlSession.selectList("matchingReport.getAllReportList",mem_id);
	}



	@Override
	public MatchingReportAttachmentVo getCertainReport(MatchingReportAttachmentVo matchingReportAttachmentVo) {
		return sqlSession.selectOne("matchingReport.getCertainReport",matchingReportAttachmentVo);
	}



}








