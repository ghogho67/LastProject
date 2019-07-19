package kr.or.ddit.approval.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.approval.dao.IApprovalDao;

@Service
public class ApprovalService implements IApprovalService{

	@Resource(name = "approvalDao")
	private IApprovalDao approvalDao;
	
	
}
