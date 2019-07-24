package kr.or.ddit.cardiac.dao;

import static org.junit.Assert.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.gold.cardiac.dao.ICardiacDao;
import kr.or.ddit.gold.cardiac.model.CardiacVo;
import kr.or.ddit.testenv.LogicTestEnv;


public class CardiacDaoTest extends LogicTestEnv{
	private static final Logger logger = LoggerFactory.getLogger(CardiacDaoTest.class);

	@Resource(name = "cardiacDao")
	private ICardiacDao cardiacDao;
	
	@Test
	public void insertCardiacDaoTest() {
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
		int cnt=cardiacDao.insertCardiac(cardiacVo);
		assertEquals(1, cnt);
	}

}
