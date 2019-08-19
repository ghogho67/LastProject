package kr.or.ddit.category.others.shelter.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.category.others.shelter.dao.IShelterDao;
import kr.or.ddit.category.others.shelter.model.ShelterVo;
import kr.or.ddit.page.model.PageVo;

@Service
public class ShelterService implements IShelterService {

	@Resource(name = "shelterDao")
	private IShelterDao shelterDao;

	/**
	* Method : shelterList
	* 작성자 : ADMIN
	* 변경이력 :
	* @return
	* Method 설명 :무더위 쉼터 리스트 조회
	*/
	@Override
	public List<ShelterVo> shelterList() {
		return shelterDao.shelterList();
	}

	/**
	* Method : shelterPagingList
	* 작성자 : ADMIN
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 :무더위 쉼터 페이징 리스트
	*/
	@Override
	public Map<String, Object> shelterPagingList(PageVo pageVo) {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("shelterList", shelterDao.shelterPagingList(pageVo));
		
		int shelterCnt = shelterDao.shelterCnt();
		int paginationSize = (int) Math.ceil((double)shelterCnt/pageVo.getPageSize());
		resultMap.put("lastpaginationSize", paginationSize);
		
		return resultMap;
	}

	/**
	* Method : getShelter
	* 작성자 : ADMIN
	* 변경이력 :
	* @param sh_id
	* @return
	* Method 설명 :특정 무더위 쉼터 조회
	*/
	@Override
	public ShelterVo getShelter(int sh_id) {
		return shelterDao.getShelter(sh_id);
	}

	/**
	* Method : getAddShelterList
	* 작성자 : ADMIN
	* 변경이력 :
	* @param sh_add
	* @return
	* Method 설명 :지역으로 검색한 무더위 쉼터
	*/
	@Override
	public List<ShelterVo> getAddShelterList(String sh_add) {
		return shelterDao.getAddShelterList(sh_add);
	}

	/**
	* Method : searchMapList
	* 작성자 : ADMIN
	* 변경이력 :
	* @param sh_add
	* @return
	* Method 설명 :지역 검색 후 주소 리스트
	*/
	@Override
	public List<String> searchMapList(String sh_add) {
		return shelterDao.searchMapList(sh_add);
	}
}
