package kr.or.ddit.member.careWorker.location.service;

import java.util.List;

import kr.or.ddit.member.careWorker.location.model.LocationVo;

public interface ILocationService {
	List<LocationVo> getLocationList(String mem_id);
}
