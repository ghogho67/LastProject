package kr.or.ddit.matching.report.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@RequestMapping("/report")
@Controller
public class ReportController {

	
	
	@RequestMapping("/reportList")
	public String report() {
		return "mypage/report/reportList";
	}
	
	
}
