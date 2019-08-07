package kr.or.ddit.approval.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.approval.model.ApprovalVo;
import kr.or.ddit.approval.service.IApprovalService;

@RequestMapping("/approval")
@Controller
public class ApprovalController {

	@Resource(name = "approvalService")
	IApprovalService approvalService;

	private static final Logger logger = LoggerFactory.getLogger(ApprovalController.class);

	@RequestMapping(path = "/show")
	public String show() {
		return "/approval/post.tiles";
	}

	@RequestMapping(path = "/matching")
	public int approval(String imp_uid, String app_type, int app_pay, HttpSession session) {

		logger.debug("☞imp_uid:{}", imp_uid);
		logger.debug("☞app_type:{}", app_type);
		logger.debug("☞app_pay:{}", app_pay);

//		MemberVo memvo = (MemberVo) session.getAttribute("MEM_INFO");
//		String mem_id = memvo.getMem_id();

		ApprovalVo avo = new ApprovalVo();

		avo.setApp_pay(app_pay);
		avo.setApp_type(app_type);
		avo.setMem_id("brown");

		int insertCnt = approvalService.approvalInsert(avo);
		logger.debug("☞insertCnt:{}", insertCnt);

		return insertCnt;
	}
}
