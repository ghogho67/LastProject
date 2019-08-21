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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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

//
	@RequestMapping(path = "/show")
	public String show() {
		return "/approval/post.tiles";
	}

	@RequestMapping(path = "/matching")
	public String approval(String imp_uid, String app_type, int app_pay, HttpSession session, Model model) {

		ApprovalVo avo = new ApprovalVo();

		avo.setApp_pay(app_pay);
		avo.setApp_type("1");
		avo.setMem_id("brown");

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
	public String approvalCheck(HttpSession session, Model model, int page, int pageSize, String searchType,
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

	@RequestMapping(path = "/approvalCheckA")
	public String approvalCheckA(Model model, int page, int pageSize, String searchType,
			@RequestParam(required = false) String searchVal) {

		PageVo pageVo = new PageVo();
		pageVo.setPage(page);
		pageVo.setPageSize(pageSize);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", pageVo.getPage());
		map.put("pageSize", pageVo.getPageSize());
		logger.debug("☞page:{}", pageVo.getPage());
		logger.debug("☞pageSize:{}", pageVo.getPageSize());
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
			model.addAttribute("approvalVo", typeSaerchList);
			model.addAttribute("startPage", startPage);
			model.addAttribute("paginationSize", paginationSize);
			model.addAttribute("lastpaginationSize", lastpaginationSize);
			model.addAttribute("pageVo", pageVo);
			model.addAttribute("page", pageVo.getPage());
			model.addAttribute("pageSize", pageVo.getPageSize());
			model.addAttribute("searchType",searchType);
			model.addAttribute("searchVal",searchVal);
			
			return"/mypage/approval/approvalCheckA.mytiles";
		
		}else if(searchType.equals("day") && !searchType.equals("")) {
			String day = searchVal;
			map.put("app_time", day);
			logger.debug("☞dayMap:{}",map);
			
			Map<String, Object> resultMap = approvalService.daySaerchList(map);
			List<ApprovalVo> daySaerchList = (List<ApprovalVo>) resultMap.get("daySaerchList");
			logger.debug("☞daySaerchList:{}",daySaerchList);
			model.addAttribute("approvalVo",daySaerchList);
			
			int startPage = ((int)Math.floor((pageVo.getPage()-1)/10)) + 1;
	        if(pageVo.getPage()==1) {
	        	startPage =1;
	        }
	        if(startPage>=2) {
	        	startPage =((int)Math.floor((pageVo.getPage()-1)/10)*10) + 1;
	        }
	        int paginationSize = ((int)Math.floor((pageVo.getPage()-1)/10 + 1))*10;
	        
	        int lastpaginationSize= (int) resultMap.get("lastpaginationSize");
	        
	        if(((int)Math.floor((pageVo.getPage()-1)/10 + 1))*10>lastpaginationSize) {
	        	paginationSize= lastpaginationSize;
	        }
	        
	        model.addAttribute("startPage", startPage);
			model.addAttribute("paginationSize", paginationSize);
			model.addAttribute("lastpaginationSize", lastpaginationSize);
			model.addAttribute("pageVo",pageVo);
			model.addAttribute("page",pageVo.getPage());
			model.addAttribute("pageSize",pageVo.getPageSize());
			model.addAttribute("searchType",searchType);
			model.addAttribute("searchVal",searchVal);
			
			return"/mypage/approval/approvalCheckA.mytiles";
			
		}else if(searchType.equals("mem_id") && !searchVal.equals("")) {
			String mem_id = searchVal;
			map.put("mem_id", mem_id);
			logger.debug("☞mem_id:{}",mem_id);
			Map<String, Object> resultMap =approvalService.approvalPageList(map);
			List<ApprovalVo> memSearchList = (List<ApprovalVo>) resultMap.get("memSearchList");
			logger.debug("☞memSearchList:{}",memSearchList);
			model.addAttribute("approvalVo",memSearchList);
			
			int startPage = ((int)Math.floor((pageVo.getPage()-1)/10)) + 1;
	        if(pageVo.getPage()==1) {
	        	startPage =1;
	        }
	        if(startPage>=2) {
	        	startPage =((int)Math.floor((pageVo.getPage()-1)/10)*10) + 1;
	        }
	        int paginationSize = ((int)Math.floor((pageVo.getPage()-1)/10 + 1))*10;
	        
	        int lastpaginationSize= (int) resultMap.get("lastpaginationSize");
	        
	        if(((int)Math.floor((pageVo.getPage()-1)/10 + 1))*10>lastpaginationSize) {
	        	paginationSize= lastpaginationSize;
	        }
	        model.addAttribute("startPage", startPage);
			model.addAttribute("paginationSize", paginationSize);
			model.addAttribute("lastpaginationSize", lastpaginationSize);
			model.addAttribute("pageVo",pageVo);
			model.addAttribute("page",pageVo.getPage());
			model.addAttribute("pageSize",pageVo.getPageSize());
			model.addAttribute("searchType",searchType);
			model.addAttribute("searchVal",searchVal);
			
			return"/mypage/approval/approvalCheckP.mytiles";
			
		}else if(searchType.equals("memid") && searchVal.equals("")){
			return "redirect:/approval/approvalCheck";
		}else if((searchType.equals("day")&&searchVal.equals(""))){
			return "redirect:/approval/approvalCheck";
		}else {
			return "redirect:/approval/approvalCheck";
			
		}
		

		return "/mypage/approval/approvalCheckA.mytiles";
	}

}





