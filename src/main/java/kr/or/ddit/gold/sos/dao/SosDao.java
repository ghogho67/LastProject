package kr.or.ddit.gold.sos.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.or.ddit.gold.sos.model.SOSVo;

@Repository
public class SosDao implements ISosDao {
	private static final Logger logger = LoggerFactory.getLogger(SosDao.class);

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
	


	@Override
	public int insertSOS(int gps_id) {
		logger.debug("!!!!!!!Dao");
		logger.debug("!!!!!!!gps_id :{}",gps_id);
		return sqlSession.insert("sos.insertSOS",gps_id);		
	}

	@Override
	public int recentData(String mem_id) {
		logger.debug("!!!!!!!Dao");
		logger.debug("!!!!!!!mem_id :{}",mem_id);
		return sqlSession.selectOne("sos.recentData",mem_id);
	}
	
}
