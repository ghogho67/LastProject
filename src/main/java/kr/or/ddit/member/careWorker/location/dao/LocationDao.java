package kr.or.ddit.member.careWorker.location.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.member.careWorker.location.model.LocationVo;

@Repository
public class LocationDao implements ILocationDao {

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<LocationVo> getLocationList(String mem_id) {
		return sqlSession.selectList("location.locationList", mem_id);
	}
}
