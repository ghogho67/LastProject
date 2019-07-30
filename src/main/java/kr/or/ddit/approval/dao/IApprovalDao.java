package kr.or.ddit.approval.dao;

import java.util.List;

import kr.or.ddit.approval.model.ApprovalVo;

public interface IApprovalDao {

	int approvalInsert(ApprovalVo avo);

	int approvalDelete(int app_id);

	ApprovalVo getApproval(int app_id);

	List<ApprovalVo> approvalList(String mem_id);


}
