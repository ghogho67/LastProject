package kr.or.ddit.member.careWorker.career.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.member.careWorker.career.model.CareerVo;

@Repository
public class CareerDao implements ICareerDao {

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<CareerVo> careerList(String mem_id) {
		return sqlSession.selectList("career.careerList", mem_id);
	}
	
}
