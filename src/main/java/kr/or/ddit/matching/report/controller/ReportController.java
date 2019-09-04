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

		int insertCnt = reportService.reportInsert(rwv);

		return "/matching/mytiles";
	}

	@RequestMapping(path = "/reportWrite")
	public String reportWrite(Model model, ReportWriteVo rwv) throws IOException {
		return "/report/reportWrite.mytiles";
	}

	/**
	* Method : getMatInfo
	* 작성자 : 정요한
	* 변경이력 :
	* @param pageVo
	* @param model
	* @param rwv
	* @param current
	* @param searchType
	* @param search
	* @param session
	* @return
	* @throws IOException
	* Method 설명 : 보고서 페이징
	*/
	@RequestMapping(path = "/pagingList")
	public String getMatInfo(PageVo pageVo, Model model, ReportWriteVo rwv,
			@RequestParam(required = false) String current, @RequestParam(required = false) String searchType,
			@RequestParam(required = false) String search, HttpSession session) throws IOException {

		pageVo.setPage(pageVo.getPage());
		pageVo.setPageSize(pageVo.getPageSize());

		MemberVo memberVo = (MemberVo) session.getAttribute("MEM_INFO");
		String mem_id = memberVo.getMem_id();
		String mem_grade = memberVo.getMem_grade();

		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();

		map.put("page", pageVo.getPage());
		map.put("pageSize", pageVo.getPageSize());

		if (mem_grade.equals("1") || mem_grade.equals("2")) {
			map.put("mem_id", mem_id);
			map.put("page", pageVo.getPage());
			map.put("pageSize", pageVo.getPageSize());

			resultMap = matchingService.matchingPagingList(map);

		} else if (mem_grade.equals("3")) {
			map.put("cw_mem_id", mem_id);
			map.put("page", pageVo.getPage());
			map.put("pageSize", pageVo.getPageSize());
			resultMap = matchingService.matchingPagingList(map);
		}

		List<ReportPageVo> reportList = new ArrayList<ReportPageVo>();
		List<MatchingVo> matchingList = (List<MatchingVo>) resultMap.get("matchingList");

		for (MatchingVo mv : matchingList) {
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
					cwMemVo.getMem_nm(), check, mv.getRn());

			ReportVo rvo = reportService.getReportVo(mv.getMat_id());

			reportList.add(rpv);
		}

		model.addAttribute("mem_grade", mem_grade);
		model.addAttribute("current", current);
		model.addAttribute("mem_id", memberVo.getMem_id());
		model.addAttribute("matchingCnt", (Integer) resultMap.get("matchingCnt"));
		model.addAttribute("paginationSize", (Integer) resultMap.get("paginationSize"));
		model.addAttribute("reportList", reportList);

		return "/report/reportPagingList.mytiles";
	}

	/**
	* Method : postRegister
	* 작성자 : 정요한
	* 변경이력 :
	* @param reportVo
	* @param mat_id
	* @param rep_title
	* @param rep_cont
	* @param model
	* @param files
	* @param reportAttachVo
	* @param session
	* @return
	* Method 설명 : 보고서 등록
	*/
	@RequestMapping(path = "/register", method = RequestMethod.POST)
	public String postRegister(ReportVo reportVo, int mat_id, String rep_title, String rep_cont, Model model,
			@RequestParam("file") MultipartFile[] files, ReportAttachVo reportAttachVo, HttpSession session) {

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
		if (reportAttachService.getReportAttachList(mat_id) != null)
			model.addAttribute("reportAttachList", reportAttachService.getReportAttachList(mat_id));
		model.addAttribute("cw_mem_id", matchingService.getMatchingVo(mat_id).getCw_mem_id());
		model.addAttribute("reportVo", reportVo);
		mvo = (MemberVo) session.getAttribute("MEM_INFO");
		model.addAttribute("mem_id", mvo.getMem_id());

		return "redirect:/report/detail";

	}

	/**
	* Method : reportModifyView
	* 작성자 : 정요한
	* 변경이력 :
	* @param mat_id
	* @param reportVo
	* @param model
	* @return
	* Method 설명 : 보고서 수정 뷰
	*/
	@RequestMapping(path = "modifyView")
	public String reportModifyView(int mat_id, ReportVo reportVo, Model model) {

		reportVo = reportService.getReportVo(mat_id);
		model.addAttribute("mat_id", mat_id);
		model.addAttribute("reportAttachList", reportAttachService.getReportAttachList(mat_id));
		model.addAttribute("reportVo", reportVo);

		return "/report/reportModify.mytiles";
	}

	/**
	* Method : postDetail
	* 작성자 : 정요한
	* 변경이력 :
	* @param mat_id
	* @param model
	* @param session
	* @return
	* Method 설명 : 보고서 상세
	*/
	@RequestMapping("detail")
	public String postDetail(int mat_id, Model model, HttpSession session) {
		model.addAttribute("reportVo", reportService.getReportVo(mat_id));
		MatchingVo mvo = matchingService.getMatchingVo(mat_id);
		model.addAttribute("mat_id", mat_id);
		model.addAttribute("cw_mem_id", mvo.getCw_mem_id());
		model.addAttribute("reportAttachList", reportAttachService.getReportAttachList(mat_id));
		MemberVo memvo = (MemberVo) session.getAttribute("MEM_INFO");
		model.addAttribute("mem_id", memvo.getMem_id());
		// 페이지 이동
		return "/report/reportDetail.mytiles";
	}

	@RequestMapping(path = "/modify", method = RequestMethod.GET)
	public String postModify(Model model, int mat_id, HttpSession session) {
		MatchingVo mvo = matchingService.getMatchingVo(mat_id);
		model.addAttribute("cw_mem_id", mvo.getCw_mem_id());
		model.addAttribute("mat_id", mat_id);
		if (reportAttachService.getReportAttachList(mat_id) != null)
			model.addAttribute("reportAttachList", reportAttachService.getReportAttachList(mat_id));
		model.addAttribute("reportVo", reportService.getReportVo(mat_id));
		MemberVo memvo = (MemberVo) session.getAttribute("MEM_INFO");
		model.addAttribute("mem_id", memvo.getMem_id());

		return "redirect:/report/detail";
	}

	/**
	* Method : postModify
	* 작성자 : 정요한
	* 변경이력 :
	* @param model
	* @param mat_id
	* @param files
	* @param reportVo
	* @param rep_title
	* @param rep_cont
	* @param mem_id
	* @param reportAttachVo
	* @param session
	* @return
	* Method 설명 : 보고서 수정
	*/
	@RequestMapping(path = "/modify", method = RequestMethod.POST)
	public String postModify(Model model, int mat_id, @RequestParam("file") MultipartFile[] files, ReportVo reportVo,
			String rep_title, String rep_cont, String mem_id, ReportAttachVo reportAttachVo, HttpSession session) {

		reportVo.setRep_title(rep_title);
		reportVo.setRep_cont(rep_cont);
		reportVo.setMat_id(mat_id);

		reportService.reportModify(reportVo);
		reportVo = reportService.getReportVo(mat_id);

		String savePath = PartUtil.getUploadPath();

		for (MultipartFile file : files) {

			if (!file.getOriginalFilename().isEmpty()) {
				String a = file.getOriginalFilename();
				String ext = PartUtil.getExt(file.getOriginalFilename());
				String fileName = UUID.randomUUID().toString();
				File uploadfile = new File(savePath + File.separator + fileName + ext);
				try {
					file.transferTo(uploadfile);
				} catch (IllegalStateException | IOException e) {
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
		model.addAttribute("reportAttachVo", reportAttachVo);
		model.addAttribute("cw_mem_id", mvo.getCw_mem_id());
		model.addAttribute("mat_id", mat_id);
		if (reportAttachService.getReportAttachList(mat_id) != null)
			model.addAttribute("reportAttachList", reportAttachService.getReportAttachList(mat_id));
		model.addAttribute("reportVo", reportVo);
		MemberVo memvo = (MemberVo) session.getAttribute("MEM_INFO");
		model.addAttribute("mem_id", memvo.getMem_id());

		return "redirect:/report/detail";

	}

}
