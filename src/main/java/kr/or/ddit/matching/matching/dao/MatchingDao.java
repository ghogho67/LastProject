package kr.or.ddit.matching.matching.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.or.ddit.matching.matching.model.MatchingVo;

@Repository
public class MatchingDao implements IMatchingDao {

	private static final Logger logger = LoggerFactory.getLogger(MatchingDao.class);

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	@Override
	public int matchingCreate(MatchingVo mvo) {
		return sqlSession.insert("matching.create", mvo);
	}

	@Override
	public int matchingDelete(int mat_id) {
		return sqlSession.update("matching.delete", mat_id);
	}

	@Override
	public int matchingModify(MatchingVo mvo) {
		logger.debug("☞mvo:{}", mvo);
		return sqlSession.update("matching.modify", mvo);
	}

	@Override
	public MatchingVo getMatchingVo(int mat_id) {
		return sqlSession.selectOne("matching.getMatchingVo", mat_id);
	}

}
