package kr.or.ddit.member.diseaseName.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository
public class DiseaseNameDao implements IDiseaseNameDao {

	private static final Logger logger = LoggerFactory.getLogger(DiseaseNameDao.class);
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	@Override
	public String getDisName(int dis_id) {
		logger.debug("☞dis_id:{}", dis_id);
		return sqlSession.selectOne("diseaseName.getDisName", dis_id);
	}

}
