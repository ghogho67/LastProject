package kr.or.ddit.memberDisease.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDiseaseDao implements IMemberDiseaseDao{
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

}
