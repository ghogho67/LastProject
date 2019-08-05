package kr.or.ddit.category.others.culture.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.category.others.culture.service.ICultureService;
@RequestMapping("/culture")
@Controller




public class CultureController {
	
	@Resource(name = "cultureService")
	private ICultureService cultureService;
	private static final Logger logger = LoggerFactory.getLogger(CultureController.class);

	
	
	
	
}
