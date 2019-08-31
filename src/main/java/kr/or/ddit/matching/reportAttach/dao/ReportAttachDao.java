package kr.or.ddit.matching.reportAttach.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.or.ddit.category.post.attachment.model.AttachmentVo;
import kr.or.ddit.matching.reportAttach.model.ReportAttachVo;

@Repository
public class ReportAttachDao implements IReportAttachDao {

	private static final Logger logger = LoggerFactory.getLogger(ReportAttachDao.class);

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	@Override
	public ReportAttachVo FileDown(int rep_att_id) {

		ReportAttachVo reportAttachVo = sqlSession.selectOne("matchingReport.FileDown", rep_att_id);
		return reportAttachVo;
	}

	@Override
	public int reportAttachInsert(ReportAttachVo reportAttachVo) {
		return sqlSession.insert("reportAttach.reportAttachInsert", reportAttachVo);
	}

	@Override
	public int reportAttachDelete(int rep_att_id) {
		return sqlSession.update("reportAttach.reportAttachDelete", rep_att_id);
	}

	@Override
	public List<ReportAttachVo> getReportAttachList(int mat_id) {
		logger.debug("☞sqlSession.selectList(\"reportAttach.getReportAttachList\", mat_id):{}",
				sqlSession.selectList("reportAttach.getReportAttachList", mat_id));
		return sqlSession.selectList("reportAttach.getReportAttachList", mat_id);
	}

	@Override
	public ReportAttachVo getReportAttach(int rep_att_id) {
		return sqlSession.selectOne("reportAttach.getReportAttach", rep_att_id);

	}

}
