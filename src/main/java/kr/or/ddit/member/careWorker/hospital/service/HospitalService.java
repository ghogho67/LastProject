package kr.or.ddit.member.careWorker.hospital.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.member.careWorker.hospital.dao.IHospitalDao;
import kr.or.ddit.member.careWorker.hospital.model.HospitalVo;
import kr.or.ddit.page.model.PageVo;

@Service
public class HospitalService implements IHospitalService{
	@Resource(name = "hospitalDao")
	private IHospitalDao hospitalDao;

	/**
	* Method : hosList
	* 작성자 : ADMIN
	* 변경이력 :
	* @return
	* Method 설명 : 병원 리스트 조회
	*/
	@Override
	public List<HospitalVo> hosList() {
		return hospitalDao.hosList();
	}

	/**
	* Method : hosPagingList
	* 작성자 : ADMIN
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : 병원 페이징 리스트 조회
	*/
	@Override
	public Map<String, Object> hosPagingList(PageVo pageVo) {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("hosList", hospitalDao.hosPagingList(pageVo));
		
		int hosCnt = hospitalDao.hosCnt();
		int paginationSize = (int) Math.ceil((double)hosCnt/pageVo.getPageSize());
		resultMap.put("paginationSize", paginationSize);
		
		return resultMap;
	}

	/**
	* Method : getHospital
	* 작성자 : ADMIN
	* 변경이력 :
	* @param hos_id
	* @return
	* Method 설명 :특정 병원 조회
	*/
	@Override
	public HospitalVo getHospital(int hos_id) {
		return hospitalDao.getHospital(hos_id);
	}

	/**
	* Method : getSearchHosAdd
	* 작성자 : ADMIN
	* 변경이력 :
	* @param hos_add
	* @return
	* Method 설명 : 지역 검색한 병원 리스트 조회
	*/
	@Override
	public List<HospitalVo> getSearchHosAdd(String hos_add) {
		return hospitalDao.getSearchHosAdd(hos_add);
	}

	/**
	* Method : searchHosPagingList
	* 작성자 : ADMIN
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 :지역검색 후 병원 페이징 리스트
	*/
	@Override
	public Map<String, Object> searchHosPagingList(Map<String, Object> map) {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("getSearchHosAdd", hospitalDao.searchHosPagingList(map));
		int searchHosCnt = hospitalDao.searchHosCnt((String)map.get("hos_add"));
		int paginationSize = (int) Math.ceil((double)searchHosCnt/(int)map.get("pageSize"));
		resultMap.put("paginationSize", paginationSize);
		
		return resultMap;
	}

	
	/**
	* Method : searchMapList
	* 작성자 : ADMIN
	* 변경이력 :
	* @param hos_add
	* @return
	* Method 설명 :지역 검색 후 주소 리스트 조회
	*/
	@Override
	public List<HospitalVo> searchMapList(String hos_add) {
		return hospitalDao.searchMapList(hos_add);
	}

	
	
}
