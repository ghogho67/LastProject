package kr.or.ddit.gold.cardiac.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.gold.cardiac.service.ICardiacService;

@RequestMapping("/cardiac")
@Controller
public class CardiacController {
	
	@Resource(name = "cardiacService")
	private ICardiacService cardiacService;
	
	@RequestMapping("/insertCardiac")
	public void insertCardiac(int car_bpm) {
		
	}

}
