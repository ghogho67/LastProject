package kr.or.ddit.matching.reportAttach.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

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

import kr.or.ddit.matching.report.model.ReportVo;
import kr.or.ddit.matching.report.service.IReportService;
import kr.or.ddit.matching.reportAttach.model.ReportAttachVo;
import kr.or.ddit.matching.reportAttach.service.IReportAttachService;
import kr.or.ddit.member.member.model.MemberVo;

@RequestMapping("/reportAttach")
@Controller
public class ReportAttachController {

	private static final Logger logger = LoggerFactory.getLogger(ReportAttachController.class);

	@Resource(name = "reportAttachService")
	private IReportAttachService reportAttachService;

	@Resource(name = "reportService")
	private IReportService reportService;

	// 0725
	@RequestMapping(path = "/download")
	public void reportAttachDownload(int mat_id, int rep_att_id, ReportAttachVo reportAttachVo,
			HttpServletRequest request, HttpServletResponse response) throws IOException {

		reportAttachVo = reportAttachService.getReportAttach(rep_att_id);

		logger.debug("☞reportAttachVo:{}", reportAttachVo);

		String fileName = reportAttachVo.getRep_att_nm();
		String path = reportAttachVo.getRep_att_path();

		byte[] b = new byte[4096];
		FileInputStream fis = new FileInputStream(path);

		File file = new File(path);

		String mimeType = request.getServletContext().getMimeType(path);
		if (mimeType == null) {
			mimeType = "application/octet-stream;charset=utf-8";
		}

		response.setHeader("Content-Disposition", "attachment;fileName=" + fileName);
		ServletOutputStream out = response.getOutputStream();

		int numRead;
		while (true) {
			numRead = fis.read(b, 0, b.length);
			if (numRead == -1)
				break;
			out.write(b, 0, numRead);
		}
		out.flush();
		out.close();
		fis.close();
	}

	// 0725
	@RequestMapping(path = "/delete")
	public String reportAttachDelete(int rep_att_id, int mat_id, Model model, ReportVo reportVo, HttpSession session) {

		logger.debug("☞rep_att_id:{}", rep_att_id);
		logger.debug("☞post_id:{}", mat_id);
		reportAttachService.reportAttachDelete(rep_att_id);
		model.addAttribute("reportAttachList", reportAttachService.getReportAttachList(mat_id));
		reportVo = reportService.getReportVo(mat_id);
		model.addAttribute("reportVo", reportVo);
		model.addAttribute("mat_id", mat_id);
		MemberVo mvo = (MemberVo) session.getAttribute("MEM_INFO");
		model.addAttribute("mem_id", mvo.getMem_id());
		return "redirect:/report/detail";

	}
}
