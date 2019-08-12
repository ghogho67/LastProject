package kr.or.ddit.member.memberDisease.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.member.memberDisease.model.MemberDiseaseVo;

@Repository
public class MemberDiseaseDao implements IMemberDiseaseDao {
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	@Override
	public List<MemberDiseaseVo> getMemDisList(String mem_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("memberDisease.getMemDisList", mem_id);
	}

}
