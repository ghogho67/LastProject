package kr.or.ddit.matching.matching.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.or.ddit.matching.matching.model.MatchingVo;
import kr.or.ddit.member.member.model.MemberVo;

@Repository
public class MatchingDao implements IMatchingDao {

	private static final Logger logger = LoggerFactory.getLogger(MatchingDao.class);

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	@Override
	public int matchingCreate(MatchingVo mvo) {
		logger.debug("☞mvo:{}", mvo);
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

	@Override
	public List<MatchingVo> getMatchingList(String cw_mem_id) {
		return sqlSession.selectList("matching.getMatchingList", cw_mem_id);
	}

	/**
	 * Method : getCareWorker 작성자 : PC24 변경이력 :
	 * 
	 * @return Method 설명 : 요양ㅂ
	 */
	@Override
	public List<MemberVo> getCareWorker() {
		return sqlSession.selectList("matching.getCareWorker");
	}

}
