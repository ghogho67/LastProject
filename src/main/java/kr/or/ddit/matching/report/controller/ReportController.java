package kr.or.ddit.matching.report.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.joinVo.MatchingReportAttachmentVo;
import kr.or.ddit.joinVo.MatchingReportVo;
import kr.or.ddit.matching.matching.service.IMatchingService;
import kr.or.ddit.matching.report.service.IReportService;
@RequestMapping("/report")
@Controller
public class ReportController {
  private static final Logger logger = LoggerFactory.getLogger(ReportController.class);

  
  @Resource(name = "matchingService")
	private IMatchingService matchingService;
  @Resource(name = "reportService")
  private IReportService reportService;
  
	
	@RequestMapping(path = "/reportList" , method = RequestMethod.GET)
	public String reportList(Model model, HttpSession session,
			RedirectAttributes redirectAttributes, HttpServletRequest request,
			@RequestParam(name = "memid") String mem_id) {
		
		logger.debug("@@@@mem_id : {} ", mem_id);
		
		List<MatchingReportVo> reportlist = reportService.getAllReportList(mem_id); 

		logger.debug("@@@@reportlist : {} ", reportlist);
		
		model.addAttribute("reportlist", reportlist);
		
		return "mypage/report/reportList";
	}
	
	
	
	
	
	@RequestMapping(path = "/report" , method = RequestMethod.GET)
	public String report(Model model, HttpSession session,
			RedirectAttributes redirectAttributes, HttpServletRequest request,
			@RequestParam(name = "reportId") String reportId,
			@RequestParam(name = "memid") String mem_id) {
		
		logger.debug("@@@@reportId : {} ", reportId);
		logger.debug("@@@@memid : {} ", mem_id);
		
		MatchingReportAttachmentVo matchingReportAttachmentVo = null;
		
		MatchingReportAttachmentVo report = reportService.getCertainReport(matchingReportAttachmentVo); 

		logger.debug("@@@@reportlist : {} ", report);
		
		model.addAttribute("report", report);
		
		return "mypage/report/report";
	}
	
	
	
}
