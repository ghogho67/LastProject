package kr.or.ddit.gold.sos.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.gold.sos.service.ISosService;
@RequestMapping("/sos")
@Controller
public class SosController {
	private static final Logger logger = LoggerFactory.getLogger(SosController.class);
	
	@Resource(name = "sosService")
	private ISosService sosService;
	
	@RequestMapping("/sosCall")
	public void sosCall(@RequestParam(value = "mem_id") String mem_id) {
		sosService.recentData(mem_id);
		
		
	}

}
