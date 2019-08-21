package kr.or.ddit.chat.chatText.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.chat.chatText.service.IChatTextService;
import kr.or.ddit.member.member.model.MemberVo;


@RequestMapping("/chatText")
@Controller
public class ChatTextController {
	private static final Logger logger = LoggerFactory.getLogger(ChatTextController.class);
	
	
	@Resource(name = "chatTextService")
	private IChatTextService chatTextService;
	
	
	@SuppressWarnings("deprecation")
	@RequestMapping(path = "/chatAllCnt", method = RequestMethod.POST)
	public String chatAllCnt(Model model, HttpSession session) {
		MemberVo memVo = (MemberVo) session.getAttribute("MEM_INFO");
		String mem_id = memVo.getMem_id();
		logger.debug("☞chatAllCnt mem_id:{}",mem_id);
		
		int allCnt = chatTextService.chatAllCnt(mem_id);
		logger.debug("☞chatAllCnt allCnt:{}",allCnt);
		int counter = 0;
		
		if(counter == 0) {
			
			counter = (int) session.getAttribute("counter");
			if(counter < allCnt) {
				int cnt = allCnt - counter;
				model.addAttribute("cnt",cnt);
				logger.debug("☞chatAllCnt 조건문들어옴allCnt:{}",cnt);
				session.removeValue("cnt");
				return "jsonView";
			}else {
				logger.debug("☞chatAllCnt allCnt 건너뜀");
				return "jsonView";
			}
			
		}else {
			logger.debug("☞chatAllCnt allCnt  맨밑으로 건너뜀");
			session.setAttribute("conter", allCnt); 
			return "jsonView";
		}
	
		}

}
