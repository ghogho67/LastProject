package kr.or.ddit.matching.matching.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.matching.matching.model.MatchingVo;

@Repository
public class MatchingDao implements IMatchingDao {

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	@Override
	public int matchingCreate(MatchingVo vo) {
		return sqlSession.insert("matching.create", vo);
	}

//	@Override
//	public List<MatchingVo> getCalendar() {
//		return sqlSession.selectList("board.getCalendar");
//	}
//
//	@Override
//	public int updateCalendar(MatchingVo vo) {
//		return sqlSession.update("board.updateCalendar", vo);
//	}

	@Override
	public int matchingDelete(int mat_id) {
		return sqlSession.update("matching.delete", mat_id);
	}
//
//	@Override
//	public List<MatchingVo> getMatchingList(String mem_id) {
//		return sqlSession.selectList("matchingReport.getMatchingList", mem_id);
//	}
//
//	@Override
//	public MatchingVo getMatching(String mat_id) {
//		return sqlSession.selectOne("matchingReport.getMatching", mat_id);
//	}

	@Override
	public MatchingVo getMatchingVo(int mat_id) {
		return sqlSession.selectOne("matching.getMatchingVo", mat_id);
	}

}
