package kr.or.ddit.matching.matching.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.matching.matching.model.MatchingVo;
import kr.or.ddit.member.member.model.MemberVo;

@Repository
public class MatchingDao implements IMatchingDao{
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
	
	



	@Override
	public List<MatchingVo> getMatchingList(String mem_id) {
		return sqlSession.selectList("matchingReport.getMatchingList",mem_id);
	}



	@Override
	public MatchingVo getMatching(String mat_id) {
		return sqlSession.selectOne("matchingReport.getMatching",mat_id);
	}

	
}
