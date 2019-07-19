package kr.or.ddit.member.careWorker.hospital.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class HospitalDao implements IHospitalDao{
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
}
