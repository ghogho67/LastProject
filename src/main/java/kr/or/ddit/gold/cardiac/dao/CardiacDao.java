package kr.or.ddit.gold.cardiac.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.or.ddit.gold.cardiac.model.CardiacVo;

@Repository
public class CardiacDao implements ICardiacDao {
	private static final Logger logger = LoggerFactory.getLogger(CardiacDao.class);
	
	 @Resource(name = "sqlSession")
	 private SqlSessionTemplate sqlSession;

	@Override
	public int insertCardiac(CardiacVo cardiacVo) {
		logger.debug("!!!!!!!Dao");
		logger.debug("!!!!!!!cardiacVo :{}",cardiacVo);
		return sqlSession.insert("cardiac.insertCardiac",cardiacVo);
	}


	 

}
