package kr.or.ddit.matching.report.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import kr.or.ddit.matching.report.model.ReportWriteVo;
import kr.or.ddit.matching.report.service.IReportService;
import kr.or.ddit.matching.reportAttach.model.ReportAttachVo;
import kr.or.ddit.matching.reportAttach.service.IReportAttachService;
import kr.or.ddit.member.member.model.MemberVo;

@RequestMapping("/report")
@Controller
public class ReportController {
	private static final Logger logger = LoggerFactory.getLogger(ReportController.class);

	@Resource(name = "matchingService")
	private IMatchingService matchingService;
	@Resource(name = "reportService")
	private IReportService reportService;

	@Resource(name = "reportAttachService")
	private IReportAttachService reportAttachService;

	
	
	
	
	
	/**
	 * Method : reportList
	 * 작성자 : 오도아
	 * 변경이력 :
	 * @param model
	 * @param session
	 * @param redirectAttributes
	 * @param request
	 * @param mem_id
	 * @param mem_grade
	 * @return
	 * Method 설명 :  리포트 목록 출력
	 */
	@RequestMapping(path = "/reportList", method = RequestMethod.GET)
	public String reportList(Model model, HttpSession session, RedirectAttributes redirectAttributes,
			HttpServletRequest request, @RequestParam(name = "memid") String mem_id,
			@RequestParam(name = "memgrade") String mem_grade) {

		logger.debug("@@@@mem_id : {} ", mem_id);
		logger.debug("@@@@mem_grade : {} ", mem_grade);

		if (mem_grade.equals("3")) {

			logger.debug("요양보호사");
			// 요양보호사 회원이 작성한 보고서
			String cw_mem_id = mem_id;

			List<MatchingReportVo> reportlist = reportService.getWorkerReportList(cw_mem_id);
			logger.debug("@@@@reportlist : {} ", reportlist);

			model.addAttribute("reportlist", reportlist);

		} else {

			List<MatchingReportVo> reportlist = reportService.getAllReportList(mem_id);
			logger.debug("@@@@reportlist : {} ", reportlist);

			model.addAttribute("reportlist", reportlist);
		}

		return "mypage/report/reportList";
	}

	
	
	
	
	/**
	 * Method : report
	 * 작성자 : 오도아
	 * 변경이력 :
	 * @param model
	 * @param session
	 * @param redirectAttributes
	 * @param request
	 * @param rep_id
	 * @param mem_id
	 * @param mem_grade
	 * @return
	 * Method 설명 : \리포트 세부 내용출력
	 */
	@RequestMapping(path = "/report", method = RequestMethod.GET)
	public String report(Model model, HttpSession session, RedirectAttributes redirectAttributes,
			HttpServletRequest request,

			@RequestParam(name = "reportId") int rep_id, @RequestParam(name = "memid") String mem_id,
			@RequestParam(name = "memgrade") String mem_grade) {

		logger.debug("@@@@memid : {} ", mem_id);
		logger.debug("@@@@reportId : {} ", rep_id);

		if (mem_grade.equals("3")) {

			logger.debug("요양보호사");

			String cw_mem_id = mem_id;

			// 요양보호사가 본인이 작성한 보고서를 볼때
			MatchingReportAttachmentVo matchingReportAttachmentVo = new MatchingReportAttachmentVo(mem_id, cw_mem_id,rep_id);
			MatchingReportAttachmentVo report = reportService.getWorkerCertainReportWA(matchingReportAttachmentVo);

			logger.debug("@@@@report : {} ", report);

			model.addAttribute("report", report);

		} else {

			MatchingReportAttachmentVo matchingReportAttachmentVo = new MatchingReportAttachmentVo(mem_id, rep_id);
			MatchingReportAttachmentVo report = reportService.getCertainReportWA(matchingReportAttachmentVo);

			logger.debug("@@@@report : {} ", report);

			model.addAttribute("report", report);
		}

		return "mypage/report/report";
	}

	
	
	
	
	
	/**
	 * Method : fileDownload
	 * 작성자 : 오도아
	 * 변경이력 :
	 * @param response
	 * @param rep_att_id
	 * @throws IOException
	 * Method 설명 :  리포트에 첨부도니 첨부 파일 출력 
	 */
	@RequestMapping(path = "/DownGOGO", method = RequestMethod.GET)
	public void fileDownload(HttpServletResponse response, @RequestParam("repattid") int rep_att_id)
			throws IOException {

		ReportAttachVo reportAttachVo = reportAttachService.FileDown(rep_att_id);
		logger.debug("@@@@fileid :{}", rep_att_id);
		// 파일로 다운로드
		response.setHeader("Content-Disposition", "attachment; filename=" + reportAttachVo.getRep_att_path());

		response.setContentType("application/octet-stream");
		response.setContentType("image");

		FileInputStream fis = new FileInputStream(new File(reportAttachVo.getRep_att_path()));

		ServletOutputStream sos = response.getOutputStream();

		byte[] buff = new byte[512];
		int len = 0;
		while ((len = fis.read(buff)) > -1) {
			sos.write(buff);
		}
		sos.close();
		fis.close();
	}

	@RequestMapping(path = "/writeView")
	public String writeView(Model model,  ReportWriteVo rwv) throws IOException {
		return "matching/report";
	}
	@RequestMapping(path = "/write", method  = RequestMethod.POST)
	public String write(Model model,  ReportWriteVo rwv, HttpSession session) throws IOException {
		MemberVo memberVo = (MemberVo) session.getAttribute("MEM_INFO");
		String mem_id = memberVo.getMem_id();
		
		rwv.setMem_id(mem_id);
		
		logger.debug("insertCntrwv:{}", rwv);
		int insertCnt = reportService.reportInsert(rwv);
		logger.debug("insertCnt:{}", insertCnt);
		
		return "matching/report";
	}
	
}
