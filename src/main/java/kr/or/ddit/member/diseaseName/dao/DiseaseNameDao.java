package kr.or.ddit.member.diseaseName.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class DiseaseNameDao implements IDiseaseNameDao {

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	@Override
	public String getDisName(int dis_id) {
		return sqlSession.selectOne("diseaseName.getDisName", dis_id);
	}
}
