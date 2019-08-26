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
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.approval.model.ApprovalVo;
import kr.or.ddit.approval.service.IApprovalService;
import kr.or.ddit.joinVo.MemberApprovalVo;
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
	public String approval(String imp_uid, ApprovalVo avo, HttpSession session,Model model) {
		
		logger.debug("☞matching");

		logger.debug("☞ApprovalVo:{}", avo);
		
		int insertCnt = approvalService.approvalInsert(avo);

		model.addAttribute("insertCnt", String.valueOf(insertCnt));

		return "jsonView";
	}

	//

//	@RequestMapping(path = "/approvalCheck")
//	public String approvalCheck(HttpSession session, Model model, int page, int pageSize) {
//		PageVo pageVo = new PageVo();
//		pageVo.setPage(page);
//		pageVo.setPageSize(pageSize);
//			
//		
//		
//		MemberVo memberVo = (MemberVo) session.getAttribute("MEM_INFO");
//		String mem_id = memberVo.getMem_id();
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("mem_id", mem_id);
//		map.put("page", pageVo.getPage());
//		map.put("pageSize", pageVo.getPageSize());
//		logger.debug("☞ mem_id:{}",mem_id);
//		logger.debug("☞pageVo.getPage() : {}", pageVo.getPage());
//		logger.debug("☞ pageVo.getPageSize():{}",pageVo.getPageSize());
//		Map<String, Object> resultMap = approvalService.approvalPageList(map);
////		logger.debug("☞!!!!!!!!:{}",(List<ApprovalVo>) resultMap.get("approvalPageList"));
//		List<ApprovalVo> appVo = (List<ApprovalVo>) resultMap.get("approvalPageList");
//		
//	        int startPage = ((int)Math.floor((pageVo.getPage()-1)/10)) + 1;
//	        if(pageVo.getPage()==1) {
//	        	startPage =1;
//	        }
//	        if(startPage>=2) {
//	        	startPage =((int)Math.floor((pageVo.getPage()-1)/10)*10) + 1;
//	        }
//	        int paginationSize = ((int)Math.floor((pageVo.getPage()-1)/10 + 1))*10;
//	        
//	        int lastpaginationSize= (int) resultMap.get("lastpaginationSize");
//	        
//	        if(((int)Math.floor((pageVo.getPage()-1)/10 + 1))*10>lastpaginationSize) {
//	        	paginationSize= lastpaginationSize;
//	        }
//	        model.addAttribute("startPage", startPage);
//			model.addAttribute("paginationSize", paginationSize);
//			model.addAttribute("lastpaginationSize", lastpaginationSize);
//			model.addAttribute("pageVo",pageVo);
//			
//
//		model.addAttribute("appVo",appVo);
//		
//
//		return"/mypage/approval/approvalCheckP.mytiles";
//	}

	@RequestMapping(path = "/approvalCheck")
	public String approvalCheck(HttpSession session, Model model,MemberApprovalVo memberapprovalVo, int page, int pageSize, String searchType,
			@RequestParam(required = false) String searchVal) {
		PageVo pageVo = new PageVo();
		pageVo.setPage(page);
		pageVo.setPageSize(pageSize);

		MemberVo memberVo = (MemberVo) session.getAttribute("MEM_INFO");
		String mem_id = memberVo.getMem_id();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_id", mem_id);
		map.put("page", pageVo.getPage());
		map.put("pageSize", pageVo.getPageSize());
		logger.debug("☞ mem_id:{}", mem_id);
		logger.debug("☞pageVo.getPage() : {}", pageVo.getPage());
		logger.debug("☞ pageVo.getPageSize():{}", pageVo.getPageSize());
		logger.debug("☞ searchType:{}", searchType);
		logger.debug("☞ searchVal:{}", searchVal);

		if (searchType.equals("type")) {

			int type = 0;
			if (searchVal == null) {
				type = 0;
			} else if (searchVal.equals("매칭")) {
				type = 1;
			} else if (searchVal.equals("골드")) {
				type = 2;
			} else if (searchVal.equals("기부")) {
				type = 3;
			}
			map.put("app_type", type);
			logger.debug("☞map:{}", map);
			logger.debug("☞type:{}", type);
			Map<String, Object> resultMap = approvalService.typeSaerchList(map);
			List<ApprovalVo> typeSaerchList = (List<ApprovalVo>) resultMap.get("typeSaerchList");

			int startPage = ((int) Math.floor((pageVo.getPage() - 1) / 10)) + 1;
			if (pageVo.getPage() == 1) {
				startPage = 1;
			}
			if (startPage >= 2) {
				startPage = ((int) Math.floor((pageVo.getPage() - 1) / 10) * 10) + 1;
			}
			int paginationSize = ((int) Math.floor((pageVo.getPage() - 1) / 10 + 1)) * 10;

			int lastpaginationSize = (int) resultMap.get("lastpaginationSize");

			if (((int) Math.floor((pageVo.getPage() - 1) / 10 + 1)) * 10 > lastpaginationSize) {
				paginationSize = lastpaginationSize;
			}
			model.addAttribute("appVo", typeSaerchList);
			model.addAttribute("startPage", startPage);
			model.addAttribute("paginationSize", paginationSize);
			model.addAttribute("lastpaginationSize", lastpaginationSize);
			model.addAttribute("pageVo", pageVo);
			model.addAttribute("page", pageVo.getPage());
			model.addAttribute("pageSize", pageVo.getPageSize());

			model.addAttribute("searchType", searchType);
			model.addAttribute("searchVal", searchVal);

//			return "jsonView";
			return "/mypage/approval/approvalCheckP.mytiles";

		} else if (searchType.equals("day") && !searchVal.equals("")) {
			String day = searchVal;
			map.put("app_time", day);
			logger.debug("☞dayMap:{}", map);
			Map<String, Object> resultMap = approvalService.daySaerchList(map);
			List<ApprovalVo> daySaerchList = (List<ApprovalVo>) resultMap.get("daySaerchList");
			logger.debug("☞daySaerchList:{}", daySaerchList);
			model.addAttribute("appVo", daySaerchList);

			int startPage = ((int) Math.floor((pageVo.getPage() - 1) / 10)) + 1;
			if (pageVo.getPage() == 1) {
				startPage = 1;
			}
			if (startPage >= 2) {
				startPage = ((int) Math.floor((pageVo.getPage() - 1) / 10) * 10) + 1;
			}
			int paginationSize = ((int) Math.floor((pageVo.getPage() - 1) / 10 + 1)) * 10;

			int lastpaginationSize = (int) resultMap.get("lastpaginationSize");

			if (((int) Math.floor((pageVo.getPage() - 1) / 10 + 1)) * 10 > lastpaginationSize) {
				paginationSize = lastpaginationSize;
			}
			model.addAttribute("startPage", startPage);
			model.addAttribute("paginationSize", paginationSize);
			model.addAttribute("lastpaginationSize", lastpaginationSize);
			model.addAttribute("pageVo", pageVo);
			model.addAttribute("page", pageVo.getPage());
			model.addAttribute("pageSize", pageVo.getPageSize());
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchVal", searchVal);

//			return "jsonView";
			return "/mypage/approval/approvalCheckP.mytiles";

		} else if (searchType.equals("memid") && searchVal.equals("")) {
			return "redirect:/approval/approvalCheck";
		} else if ((searchType.equals("day") && searchVal.equals(""))) {
			return "redirect:/approval/approvalCheck";
		} else {
			return "redirect:/approval/approvalCheck";

		}

	}

	@RequestMapping(path = "/search")
	public String saerchList(Model model, String searchType, String searchVal, HttpSession session, int page,
			int pageSize) {
		logger.debug("☞ 서치리스트 여기들어오니?");
		logger.debug("☞ searchType : {} ", searchType);
		logger.debug("☞ searchVal : {}", searchVal);
		logger.debug("☞  page : {}", page);
		logger.debug("☞ pageSize : {}", pageSize);
		PageVo pageVo = new PageVo();
		pageVo.setPage(page);
		pageVo.setPageSize(pageSize);

		MemberVo memvo = (MemberVo) session.getAttribute("MEM_INFO");
		String mem_id = memvo.getMem_id();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_id", mem_id);
		map.put("page", pageVo.getPage());
		map.put("pageSize", pageVo.getPageSize());

		if (searchType.equals("type") && !searchVal.equals("")) {
			String typeName = searchVal;
			int type = 0;
			if (typeName.equals("매칭")) {
				type = 1;
			} else if (typeName.equals("골드")) {
				type = 2;
			} else if (typeName.equals("기부")) {
				type = 3;
			}
			map.put("app_type", type);
			logger.debug("☞map:{}", map);
			logger.debug("☞typeName:{}", typeName);
			logger.debug("☞type:{}", type);
			Map<String, Object> resultMap = approvalService.typeSaerchList(map);
			List<ApprovalVo> typeSaerchList = (List<ApprovalVo>) resultMap.get("typeSaerchList");

			int startPage = ((int) Math.floor((pageVo.getPage() - 1) / 10)) + 1;
			if (pageVo.getPage() == 1) {
				startPage = 1;
			}
			if (startPage >= 2) {
				startPage = ((int) Math.floor((pageVo.getPage() - 1) / 10) * 10) + 1;
			}
			int paginationSize = ((int) Math.floor((pageVo.getPage() - 1) / 10 + 1)) * 10;

			int lastpaginationSize = (int) resultMap.get("lastpaginationSize");

			if (((int) Math.floor((pageVo.getPage() - 1) / 10 + 1)) * 10 > lastpaginationSize) {
				paginationSize = lastpaginationSize;
			}
			model.addAttribute("appVo", typeSaerchList);
			model.addAttribute("startPage", startPage);
			model.addAttribute("paginationSize", paginationSize);
			model.addAttribute("lastpaginationSize", lastpaginationSize);
			model.addAttribute("pageVo", pageVo);
			model.addAttribute("page", pageVo.getPage());
			model.addAttribute("pageSize", pageVo.getPageSize());

//			return "jsonView";
			return "/mypage/approval/approvalCheckP.mytiles";

		} else if (searchType.equals("day") && !searchVal.equals("")) {
			String day = searchVal;
			map.put("app_time", day);
			Map<String, Object> resultMap = approvalService.daySaerchList(map);
			List<ApprovalVo> daySaerchList = (List<ApprovalVo>) resultMap.get("daySaerchList");
			model.addAttribute("appVo", daySaerchList);

			int startPage = ((int) Math.floor((pageVo.getPage() - 1) / 10)) + 1;
			if (pageVo.getPage() == 1) {
				startPage = 1;
			}
			if (startPage >= 2) {
				startPage = ((int) Math.floor((pageVo.getPage() - 1) / 10) * 10) + 1;
			}
			int paginationSize = ((int) Math.floor((pageVo.getPage() - 1) / 10 + 1)) * 10;

			int lastpaginationSize = (int) resultMap.get("lastpaginationSize");

			if (((int) Math.floor((pageVo.getPage() - 1) / 10 + 1)) * 10 > lastpaginationSize) {
				paginationSize = lastpaginationSize;
			}
			model.addAttribute("startPage", startPage);
			model.addAttribute("paginationSize", paginationSize);
			model.addAttribute("lastpaginationSize", lastpaginationSize);
			model.addAttribute("pageVo", pageVo);
			model.addAttribute("page", pageVo.getPage());
			model.addAttribute("pageSize", pageVo.getPageSize());

//			return "jsonView";
			return "/mypage/approval/approvalCheckP.mytiles";

		} else if (searchType.equals("memid") && searchVal.equals("")) {
			return "redirect:/approval/approvalCheck";
		} else if ((searchType.equals("day") && searchVal.equals(""))) {
			return "redirect:/approval/approvalCheck";
		} else {
			return "redirect:/approval/approvalCheck";

		}
	}

	
	
	/**
	* Method : approvalCheckA
	* 작성자 : ADMIN
	* 변경이력 :
	* @param model
	* @param pageVo
	* @param page
	* @param pageSize
	* @return
	* Method 설명 : 관리자 결산관리 - 등급별 pie chart
	*/
	@RequestMapping("/approvalCheckA")
	public String approvalCheckA(Model model,PageVo pageVo, int page, int pageSize, MemberApprovalVo memberApprovalVo) {
		
		pageVo = new PageVo();
		pageVo.setPage(page);
		pageVo.setPageSize(pageSize);
		
		Map<String, Object> resultMap = approvalService.approvalAllPagingList(pageVo);
		logger.debug("☞resultMap:{}", resultMap);
		
		List<MemberApprovalVo> memberApprovalAllList = (List<MemberApprovalVo>) resultMap.get("memberApprovalAllList");
		int startPage = ((int) Math.floor((pageVo.getPage() - 1) / 10)) + 1;
		if (pageVo.getPage() == 1) {
			startPage = 1;
		}
		if (startPage >= 2) {
			startPage = ((int) Math.floor((pageVo.getPage() - 1) / 10) * 10) + 1;
		}
		int paginationSize = ((int) Math.floor((pageVo.getPage() - 1) / 10 + 1)) * 10;

		int lastpaginationSize = (int) resultMap.get("lastpaginationSize");

		if (((int) Math.floor((pageVo.getPage() - 1) / 10 + 1)) * 10 > lastpaginationSize) {
			paginationSize = lastpaginationSize;
		}
		
		model.addAttribute("memberApprovalAllList", memberApprovalAllList);
		model.addAttribute("startPage", startPage);
		model.addAttribute("paginationSize", paginationSize);
		model.addAttribute("lastpaginationSize", lastpaginationSize);
		model.addAttribute("pageVo", pageVo);
		
		logger.debug("☞memberApprovalAllList:{}", memberApprovalAllList);
		logger.debug("☞paginationSize:{}", paginationSize);
		logger.debug("☞pageVo:{}", pageVo);
		logger.debug("☞startPage:{}",startPage);
		logger.debug("☞lastpaginationSize:{}",lastpaginationSize);
		
		
		// 구글 pie chart API - 회원별 매출 비율
		model.addAttribute("nomalMember", approvalService.gradeApproval("1"));
		model.addAttribute("goldMember", approvalService.gradeApproval("2"));
		model.addAttribute("careWorker", approvalService.gradeApproval("3"));
		
		logger.debug("☞nomalMember:{}",approvalService.gradeApproval("1"));
		logger.debug("☞goldMember:{}",approvalService.gradeApproval("2"));
		logger.debug("☞careWorker:{}",approvalService.gradeApproval("3"));
		
		logger.debug("☞nomalmember:{}",approvalService.totalApprovalType_admin("1"));
		logger.debug("☞goldmember:{}",approvalService.totalApprovalType_admin("2"));
		logger.debug("☞careworker:{}",approvalService.totalApprovalType_admin("3"));
		//구글 pie chart API - (관리자) 회원등급별 매출비율
		model.addAttribute("nomalmember", approvalService.totalApprovalType_admin("1"));
		model.addAttribute("goldmember", approvalService.totalApprovalType_admin("2"));
		model.addAttribute("careworker", approvalService.totalApprovalType_admin("3"));

	
		return "/mypage/approval/approvalCheckA.mytiles";

	}
	
	

}





