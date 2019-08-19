package kr.or.ddit.approval.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.approval.model.ApprovalVo;
import kr.or.ddit.approval.service.IApprovalService;
import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.page.model.PageVo;

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
	public String approval(String imp_uid, String app_type, int app_pay, HttpSession session, Model model) {

		ApprovalVo avo = new ApprovalVo();

		avo.setApp_pay(app_pay);
		avo.setApp_type(app_type);
		avo.setMem_id("brown");

		int insertCnt = approvalService.approvalInsert(avo);

		model.addAttribute("insertCnt", String.valueOf(insertCnt));

		return "jsonView";
	}
	

	@RequestMapping(path = "/approvalCheck")
	public String approvalCheck(HttpSession session, Model model) {
		MemberVo memberVo = (MemberVo) session.getAttribute("MEM_INFO");
		String mem_id = memberVo.getMem_id();
		PageVo pageVo = new PageVo();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_id", mem_id);
		map.put("page", pageVo.getPage());
		map.put("pageSize", pageVo.getPageSize());
		logger.debug("☞ mem_id:{}",mem_id);
		logger.debug("☞pageVo.getPage() : {}", pageVo.getPage());
		logger.debug("☞ pageVo.getPageSize():{}",pageVo.getPageSize());
		Map<String, Object> resultMap = approvalService.approvalPageList(map);
//		logger.debug("☞!!!!!!!!:{}",(List<ApprovalVo>) resultMap.get("approvalPageList"));
		List<ApprovalVo> appVo = (List<ApprovalVo>) resultMap.get("approvalPageList");
		model.addAttribute("appVo",appVo);
		model.addAttribute("pageVo",pageVo);
		model.addAttribute("paginationSize",resultMap.get("paginationSize"));
		

		return"/mypage/approval/appovalCheckP.mytiles";
	}
	
	
	
	
	
}
