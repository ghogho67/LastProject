package kr.or.ddit.cardiac.service;

import static org.junit.Assert.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.gold.cardiac.model.CardiacVo;
import kr.or.ddit.gold.cardiac.service.ICardiacService;
import kr.or.ddit.testenv.LogicTestEnv;

public class CardiacServiceTest extends LogicTestEnv{
	@Resource(name = "cardiacService")
	private ICardiacService cardiacService;
	@Test
	public void insertCardiacServiceTest() {
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		
		CardiacVo cardiacVo =  new CardiacVo();
		cardiacVo.setCar_bpm(90);
		cardiacVo.setMem_id("brown");
		try {
			cardiacVo.setGold_st(sdf.parse("19/07/21"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int cnt=cardiacService.insertCardiac(cardiacVo);
		assertEquals(1, cnt);
	}
}
