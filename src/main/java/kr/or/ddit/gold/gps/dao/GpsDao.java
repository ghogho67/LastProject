package kr.or.ddit.gold.gps.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.or.ddit.gold.gold.model.GoldVo;
import kr.or.ddit.gold.gps.model.GpsVo;

@Repository
public class GpsDao implements IGpsDao {
	private static final Logger logger = LoggerFactory.getLogger(GpsDao.class);
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertGps(GpsVo gpsVo) {
		logger.debug("!!!!!!!Dao");
		logger.debug("!!!!!!!gpsVo :{}",gpsVo);
		return sqlSession.insert("gps.insertGps",gpsVo);
		
	}

	@Override
	public GoldVo getGoldMember(String mem_id) {
		return sqlSession.selectOne("gps.getGoldMember",mem_id);
	}

	@Override
	public int getCardiac(String mem_id) {
		return sqlSession.selectOne("gps.getCardiac",mem_id);
	}

	@Override
	public List<GpsVo> oneDayBpm(GpsVo gpsVo) {
		return sqlSession.selectList("gps.oneDayBpm", gpsVo);
	}
	
}
