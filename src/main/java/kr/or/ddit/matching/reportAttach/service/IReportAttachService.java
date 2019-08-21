package kr.or.ddit.matching.reportAttach.service;

import java.util.List;

import kr.or.ddit.category.post.attachment.model.AttachmentVo;
import kr.or.ddit.matching.reportAttach.model.ReportAttachVo;

public interface IReportAttachService {
	
	public ReportAttachVo FileDown(int rep_att_id);

	int reportAttachInsert(ReportAttachVo reportAttachVo);

	int reportAttachDelete(int rep_att_id);

	List<ReportAttachVo> getReportAttachList(int mat_id);

	ReportAttachVo getReportAttach(int rep_att_id);
	
}
