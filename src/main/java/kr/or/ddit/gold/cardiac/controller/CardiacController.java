package kr.or.ddit.gold.cardiac.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.gold.cardiac.model.CardiacVo;
import kr.or.ddit.gold.cardiac.service.ICardiacService;

@RequestMapping("/cardiac")
@Controller
public class CardiacController {
	private static final Logger logger = LoggerFactory.getLogger(CardiacController.class);
	
	@Resource(name = "cardiacService")
	private ICardiacService cardiacService;
	
	@RequestMapping("/insertCardiac")
	public void insertCardiac( @RequestParam(value = "car_bpm") int car_bpm) {
		logger.debug("!!!!!!!car_bpm :{}",car_bpm);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		
		CardiacVo cardiacVo =  new CardiacVo();
		cardiacVo.setCar_bpm(car_bpm);
		cardiacVo.setMem_id("brown");
		try {
			cardiacVo.setGold_st(sdf.parse("19/07/21"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		cardiacService.insertCardiac(cardiacVo);
		
		
	}

}
