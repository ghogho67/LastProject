package kr.or.ddit.member.careWorker.hospitalType.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class HospitalTypeDao implements IHospitalTypeDao {
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
}
