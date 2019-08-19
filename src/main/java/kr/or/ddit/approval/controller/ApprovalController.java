package kr.or.ddit.approval.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.xml.crypto.dsig.keyinfo.PGPData;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.approval.model.ApprovalVo;
import kr.or.ddit.approval.service.IApprovalService;
import kr.or.ddit.joinVo.AttendanceMatchingVo;
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
	public String approvalCheck(HttpSession session, Model model, int page, int pageSize) {
		PageVo pageVo = new PageVo();
		pageVo.setPage(page);
		pageVo.setPageSize(pageSize);
			
		
		
		MemberVo memberVo = (MemberVo) session.getAttribute("MEM_INFO");
		String mem_id = memberVo.getMem_id();
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
			

		model.addAttribute("appVo",appVo);
		

		return"/mypage/approval/appovalCheckP.mytiles";
	}
	
	
	
	@RequestMapping(path = "/saerch", method = RequestMethod.POST)
	public String saerchList(Model model, String searchType, String saerchVal,HttpSession session,int page, int pageSize) {
		PageVo pageVo = new PageVo();
		pageVo.setPage(page);
		pageVo.setPageSize(pageSize);
		
		
		MemberVo memvo = (MemberVo) session.getAttribute("MEM_INFO");
		String mem_id = memvo.getMem_id();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_id", mem_id);
		map.put("page", pageVo.getPage());
		map.put("pageSize", pageVo.getPageSize());
		
		
		if(searchType.equals("type")&&!saerchVal.equals("")) {
			String typeName = saerchVal;
			int type = 0;
			if(typeName.equals("매칭")) {
				type = 1;
			}else if(typeName.equals("골드")) {
				type = 2;
			}else if(typeName.equals("기부")) {
				type = 3;
			}
			map.put("type", type);
			Map<String, Object> resultMap = approvalService.typeSaerchList(map);
			List<ApprovalVo>appVo = (List<ApprovalVo>) resultMap.get("typeSaerchList");
			
			model.addAttribute("appVo",appVo);
			
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
			
			return "/mypage/approval/appovalCheckP.mytiles";
		
			
			
			
		}else if(searchType.equals("day")&&!saerchVal.equals("")) {
			String day = saerchVal;
			map.put("day", day);
			Map<String, Object> resultMap = approvalService.daySaerchList(map);
			List<ApprovalVo>appVo = (List<ApprovalVo>) resultMap.get("daySaerchList");
			model.addAttribute("appVo",appVo);
			
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
			
			return "/mypage/approval/appovalCheckP.mytiles";
			
		}else if(searchType.equals("memid") && saerchVal.equals("")){
			return "redirect:/approval/approvalCheck";
		}else if((searchType.equals("day")&&saerchVal.equals(""))){
			return "redirect:/approval/approvalCheck";
		}else {
			return "redirect:/approval/approvalCheck";
			
		}
	}
	
	
}

