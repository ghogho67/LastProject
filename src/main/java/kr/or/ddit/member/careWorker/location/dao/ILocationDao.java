package kr.or.ddit.member.careWorker.location.dao;

import java.util.List;

import kr.or.ddit.member.careWorker.location.model.LocationVo;

public interface ILocationDao {
	List<LocationVo> getLocationList(String mem_id);
}
