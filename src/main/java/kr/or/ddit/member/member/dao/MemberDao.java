package kr.or.ddit.member.member.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao implements IMemberDao{
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
}
