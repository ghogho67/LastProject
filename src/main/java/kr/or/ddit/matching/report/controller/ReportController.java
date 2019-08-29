package kr.or.ddit.matching.report.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.joinVo.MatchingReportVo;
import kr.or.ddit.matching.matching.model.MatchingVo;
import kr.or.ddit.matching.matching.service.IMatchingService;
import kr.or.ddit.matching.report.model.ReportPageVo;
import kr.or.ddit.matching.report.model.ReportVo;
import kr.or.ddit.matching.report.model.ReportWriteVo;
import kr.or.ddit.matching.report.service.IReportService;
import kr.or.ddit.matching.reportAttach.model.ReportAttachVo;
import kr.or.ddit.matching.reportAttach.service.IReportAttachService;
import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.member.member.service.IMemberService;
import kr.or.ddit.page.model.PageVo;
import kr.or.ddit.util.PartUtil;

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

	@Resource(name = "memberService")
	private IMemberService memberService;

	/**
	 * Method : reportList 작성자 : 오도아 변경이력 :
	 * 
	 * @param model
	 * @param session
	 * @param redirectAttributes
	 * @param request
	 * @param mem_id
	 * @param mem_grade
	 * @return Method 설명 : 리포트 목록 출력
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
	 * Method : report 작성자 : 오도아 변경이력 :
	 * 
	 * @param model
	 * @param session
	 * @param redirectAttributes
	 * @param request
	 * @param rep_id
	 * @param mem_id
	 * @param mem_grade
	 * @return Method 설명 : 리포트 세부 내용출력
	 */
//	@RequestMapping(path = "/report", method = RequestMethod.GET)
//	public String report(Model model, HttpSession session, RedirectAttributes redirectAttributes,
//			HttpServletRequest request,
//
//			@RequestParam(name = "reportId") int rep_id, @RequestParam(name = "memid") String mem_id,
//			@RequestParam(name = "memgrade") String mem_grade) {
//
//		logger.debug("@@@@memid : {} ", mem_id);
//		logger.debug("@@@@reportId : {} ", rep_id);
//
//		if (mem_grade.equals("3")) {
//
//			logger.debug("요양보호사");
//
//			String cw_mem_id = mem_id;
//
//			// 요양보호사가 본인이 작성한 보고서를 볼때
//			MatchingReportAttachmentVo matchingReportAttachmentVo = new MatchingReportAttachmentVo(mem_id, cw_mem_id,rep_id);
//			MatchingReportAttachmentVo report = reportService.getWorkerCertainReportWA(matchingReportAttachmentVo);
//
//			logger.debug("@@@@report : {} ", report);
//
//			model.addAttribute("report", report);
//
//		} else {
//
//			MatchingReportAttachmentVo matchingReportAttachmentVo = new MatchingReportAttachmentVo(mem_id, rep_id);
//			MatchingReportAttachmentVo report = reportService.getCertainReportWA(matchingReportAttachmentVo);
//
//			logger.debug("@@@@report : {} ", report);
//
//			model.addAttribute("report", report);
//		}
//
//		return "mypage/report/report";
//	}
//
//	

	/**
	 * Method : fileDownload 작성자 : 오도아 변경이력 :
	 * 
	 * @param response
	 * @param rep_att_id
	 * @throws IOException Method 설명 : 리포트에 첨부도니 첨부 파일 출력
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
	public String writeView(Model model, ReportWriteVo rwv) throws IOException {
		return "matching/report";
	}

	@RequestMapping(path = "/write", method = RequestMethod.POST)
	public String write(Model model, ReportWriteVo rwv, HttpSession session) throws IOException {
		MemberVo memberVo = (MemberVo) session.getAttribute("MEM_INFO");
		String mem_id = memberVo.getMem_id();

		rwv.setMem_id(mem_id);

		logger.debug("insertCntrwv:{}", rwv);
		int insertCnt = reportService.reportInsert(rwv);
		logger.debug("insertCnt:{}", insertCnt);

		return "/matching/mytiles";
	}

	@RequestMapping(path = "/reportWrite")
	public String reportWrite(Model model, ReportWriteVo rwv) throws IOException {
		return "/report/reportWrite.mytiles";
	}

	@RequestMapping(path = "/pagingList")
	public String getMatInfo(PageVo pageVo, Model model, ReportWriteVo rwv,
			@RequestParam(required = false) String current, @RequestParam(required = false) String searchType,
			@RequestParam(required = false) String search, HttpSession session) throws IOException {
		logger.debug("☞/reportcontroller/pagingList");

		pageVo.setPage(pageVo.getPage());
		pageVo.setPageSize(pageVo.getPageSize());

		logger.debug("☞searchType:{}", searchType);

		MemberVo memberVo = (MemberVo) session.getAttribute("MEM_INFO");
		String mem_id = memberVo.getMem_id();
		String mem_grade = memberVo.getMem_grade();

		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();

		map.put("page", pageVo.getPage());
		map.put("pageSize", pageVo.getPageSize());
		
		logger.debug("☞map:{}", map);
		
		if(mem_grade.equals("1")||mem_grade.equals("2")) {
			map.put("mem_id", mem_id);
			map.put("page", pageVo.getPage());
			map.put("pageSize", pageVo.getPageSize());
			
			resultMap = matchingService.matchingPagingList(map);
			logger.debug("☞resultMap:{}",resultMap);
			
		} else if(mem_grade.equals("3")) {
			map.put("cw_mem_id", mem_id);
			map.put("page", pageVo.getPage());
			map.put("pageSize", pageVo.getPageSize());
			resultMap = matchingService.matchingPagingList(map);
			logger.debug("☞resultMap:{}",resultMap);
			
		}

		List<ReportPageVo> reportList = new ArrayList<ReportPageVo>();
		List<MatchingVo> matchingList = (List<MatchingVo>) resultMap.get("matchingList");
		
		logger.debug("☞matchingList:{}",matchingList);

		for (MatchingVo mv : matchingList) {
//			ReportVo rv = reportService.getReportVo(mv.getMat_id());
//			logger.debug("☞rv:{}",rv);
			String st = mv.getMat_st();
			int idx = mv.getMat_st().indexOf(" ");
			String day = st.substring(0, idx);
			String stTime = st.substring(idx + 1);

			String end = mv.getMat_end();
			String endTime = end.substring(idx + 1);

			ReportVo checkReportVo = reportService.getReportVo(mv.getMat_id());

			int check = 1;
			if (checkReportVo == null) {
				check = 0;
			} else {
				check = 1;
			}

			MemberVo memVo = memberService.getMemVo(mv.getMem_id());
			MemberVo cwMemVo = memberService.getMemVo(mv.getCw_mem_id());

			ReportPageVo rpv = new ReportPageVo(mv.getMat_id(), mv.getMat_title(), mv.getMat_cont(), day, stTime,
					endTime, mv.getMat_type(), mv.getMem_id(), mv.getCw_mem_id(), memVo.getMem_nm(),
					cwMemVo.getMem_nm(),check,mv.getRn());

			ReportVo rvo = reportService.getReportVo(mv.getMat_id());
			
			logger.debug("☞rpv:{}",rpv);

			reportList.add(rpv);
		}
		logger.debug("rpl:{}", reportList);

		model.addAttribute("mem_grade", mem_grade);
		model.addAttribute("current", current);
		model.addAttribute("mem_id", memberVo.getMem_id());
		model.addAttribute("matchingCnt", (Integer) resultMap.get("matchingCnt"));
		model.addAttribute("paginationSize", (Integer) resultMap.get("paginationSize"));
		model.addAttribute("reportList", reportList);
		logger.debug("☞reportList:{}",reportList);

		return "/report/reportPagingList.mytiles";
	}

	@RequestMapping(path = "/register", method = RequestMethod.POST)
	public String postRegister(ReportVo reportVo, int mat_id, String rep_title, String rep_cont, Model model,
			@RequestParam("file") MultipartFile[] files, ReportAttachVo reportAttachVo, HttpSession session) {

		logger.debug("☞reportVo:{}", reportVo);

		MemberVo mvo = (MemberVo) session.getAttribute("MEM_INFO");
		reportVo.setRep_title(rep_title);
		reportVo.setRep_cont(rep_cont);
		reportVo.setMat_id(mat_id);

		// 게시글등록---------------------------------------------------------------------------------------

		ReportVo checkReportVo = reportService.getReportVo(mat_id);
		if (checkReportVo == null) {
			int insertCnt = reportService.reportWrite(reportVo);
		} else {
			logger.debug("☞이미 저장한 내용이 있습니다:{}", " 이미 저장한 내용이 있습니다");
		}

		reportVo = reportService.getLatestReport();

		String savePath = PartUtil.getUploadPath();
		for (MultipartFile file : files) {
			if (!file.getOriginalFilename().isEmpty()) {
				String att_nm = file.getOriginalFilename();
				String ext = PartUtil.getExt(file.getOriginalFilename());
				String fileName = UUID.randomUUID().toString();
				File uploadfile = new File(savePath + File.separator + fileName + ext);
				try {
					file.transferTo(uploadfile);
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				reportAttachVo.setRep_att_nm(file.getOriginalFilename());
				reportAttachVo.setRep_att_path(savePath + File.separator + fileName + ext);
				reportAttachVo.setMat_id(mat_id);
				;
				reportAttachService.reportAttachInsert(reportAttachVo);
			}
		}

		model.addAttribute("mat_id", mat_id);
		logger.debug("☞reportAttachService.getReportAttachList(mat_id):{}",
				reportAttachService.getReportAttachList(mat_id));
		if (reportAttachService.getReportAttachList(mat_id) != null)
			model.addAttribute("reportAttachList", reportAttachService.getReportAttachList(mat_id));
		model.addAttribute("cw_mem_id", matchingService.getMatchingVo(mat_id).getCw_mem_id());
		model.addAttribute("reportVo", reportVo);
		mvo = (MemberVo) session.getAttribute("MEM_INFO");
		model.addAttribute("mem_id", mvo.getMem_id());

		return "/report/reportDetail.mytiles";

	}

	@RequestMapping(path = "modifyView")
	public String reportModifyView(int mat_id, ReportVo reportVo, Model model) {

		reportVo = reportService.getReportVo(mat_id);
		model.addAttribute("mat_id", mat_id);
		model.addAttribute("reportAttachList", reportAttachService.getReportAttachList(mat_id));
		model.addAttribute("reportVo", reportVo);

		return "/report/reportModify.mytiles";
	}

	@RequestMapping("detail")
	public String postDetail(int mat_id, Model model, HttpSession session) {

		model.addAttribute("reportVo", reportService.getReportVo(mat_id));
		MatchingVo mvo = matchingService.getMatchingVo(mat_id);

		model.addAttribute("mat_id", mat_id);
		model.addAttribute("cw_mem_id", mvo.getCw_mem_id());
		model.addAttribute("reportAttachList", reportAttachService.getReportAttach(mat_id));
		MemberVo memvo = (MemberVo) session.getAttribute("MEM_INFO");
		model.addAttribute("mem_id", memvo.getMem_id());
		// 페이지 이동
		return "/report/reportDetail.mytiles";
	}

	@RequestMapping(path = "/modify", method = RequestMethod.POST)
	public String postModify(Model model, int mat_id, @RequestParam("file") MultipartFile[] files, ReportVo reportVo,
			String rep_title, String rep_cont, String mem_id, ReportAttachVo reportAttachVo, HttpSession session) {

		reportVo.setRep_title(rep_title);
		reportVo.setRep_cont(rep_cont);
		reportVo.setMat_id(mat_id);

		reportService.reportModify(reportVo);
		reportVo = reportService.getReportVo(mat_id);

		// 댓글과 첨부파일 가져오기
		// file data 받기=======================================================
		// DB에 저장할 파일명
		String savePath = PartUtil.getUploadPath();

		for (MultipartFile file : files) {
			logger.debug("☞file:{}", file);

			if (!file.getOriginalFilename().isEmpty()) {
				String a = file.getOriginalFilename();
				String ext = PartUtil.getExt(file.getOriginalFilename());
				String fileName = UUID.randomUUID().toString();
				File uploadfile = new File(savePath + File.separator + fileName + ext);
				logger.debug("savePath +File.separator+ fileName + ext:{}", savePath + File.separator + fileName + ext);
				try {
					file.transferTo(uploadfile);
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				reportAttachVo.setRep_att_nm(file.getOriginalFilename());
				reportAttachVo.setRep_att_path(savePath + File.separator + fileName + ext);
				reportAttachVo.setMat_id(mat_id);
				;

				reportAttachService.reportAttachInsert(reportAttachVo);
			}
		}
		MatchingVo mvo = matchingService.getMatchingVo(mat_id);
		logger.debug("☞mvo:{}", mvo);
		model.addAttribute("reportAttachVo", reportAttachVo);
		model.addAttribute("cw_mem_id", mvo.getCw_mem_id());
		model.addAttribute("mat_id", mat_id);
		logger.debug("☞reportAttachList", reportAttachService.getReportAttachList(mat_id));
		if (reportAttachService.getReportAttachList(mat_id) != null)
			model.addAttribute("reportAttachList", reportAttachService.getReportAttachList(mat_id));
		model.addAttribute("reportVo", reportVo);
		MemberVo memvo = (MemberVo) session.getAttribute("MEM_INFO");
		model.addAttribute("mem_id", memvo.getMem_id());

		return "/report/reportDetail.mytiles";

	}

}
