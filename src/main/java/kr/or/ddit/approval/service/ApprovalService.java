package kr.or.ddit.approval.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.approval.dao.IApprovalDao;
import kr.or.ddit.approval.model.ApprovalVo;

@Service
public class ApprovalService implements IApprovalService {

	@Resource(name = "approvalDao")
	private IApprovalDao approvalDao;

	@Override
	public int approvalInsert(ApprovalVo avo) {
		return approvalDao.approvalInsert(avo);
	}

	@Override
	public int approvalDelete(int app_id) {
		return approvalDao.approvalDelete(app_id);
	}

	@Override
	public ApprovalVo getApproval(int app_id) {
		return approvalDao.getApproval(app_id);
	}

	@Override
	public List<ApprovalVo> approvalList(String mem_id) {
		return approvalDao.approvalList(mem_id);
	}

}
