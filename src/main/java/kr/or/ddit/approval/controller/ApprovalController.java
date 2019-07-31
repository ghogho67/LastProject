package kr.or.ddit.approval.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/approval")
@Controller
public class ApprovalController {

	private static final Logger logger = LoggerFactory.getLogger(ApprovalController.class);

	@RequestMapping(path = "/show")
	public String show() {
		return "/approval/post.tiles";
	}
//
//	@RequestMapping(path = "/approval")
//	public String approval(@RequestBody Search search, HttpServletRequest request, Model model) {
//		String pName = search.getlName();
//		String lName = search.getpName();
//
//		model.addAttribute("pName", pName);
//		model.addAttribute("lName", lName);
//
//		logger.debug("☞pName	:{}", pName);
//		logger.debug("☞lName	:{}", lName);
//
//		return "jsonView";
//	}

}
