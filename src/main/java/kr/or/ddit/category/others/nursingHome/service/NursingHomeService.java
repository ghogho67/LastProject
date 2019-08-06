package kr.or.ddit.category.others.nursingHome.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.category.others.nursingHome.dao.INursingHomeDao;
import kr.or.ddit.category.others.nursingHome.model.NursingHomeVo;
import kr.or.ddit.page.model.PageVo;

@Service
public class NursingHomeService implements INursingHomeService{
	
	@Resource(name = "nursingHomeDao")
	private INursingHomeDao nursingHomeDao;

	/**
	* Method : nursingList
	* 작성자 : ADMIN
	* 변경이력 :
	* @return
	* Method 설명 :요양시설 전체 리스트 조회(높은 평점 순)
	*/
	@Override
	public List<NursingHomeVo> nursingList() {
		return nursingHomeDao.nursingList();
	}
	/**
	* Method : nursingPagingList
	* 작성자 : ADMIN
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : 요양시설 리스트 페이지 처리(높은 평점 순)
	*/
	@Override
	public Map<String, Object> nursingPagingList(PageVo pageVo) {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("nursingList", nursingHomeDao.nursingPagingList(pageVo));
		 int nursingCnt = nursingHomeDao.nursingCnt();
		 int paginationSize = (int) Math.ceil((double)nursingCnt/pageVo.getPageSize());
		resultMap.put("paginationSize", paginationSize);
	
		return resultMap;
	}

	/**
	* Method : searchNursingHome
	* 작성자 : ADMIN
	* 변경이력 :
	* @param nh_add
	* @return
	* Method 설명 :지역으로 검색 후 요양시설 리스트 조회(높은 평점순 )
	*/
	@Override
	public List<NursingHomeVo> searchNursingHome(String nh_add) {
		return nursingHomeDao.searchNursingHome(nh_add);
	}
	
	/**
	* Method : getNursingHome
	* 작성자 : ADMIN
	* 변경이력 :
	* @param nh_id
	* @return
	* Method 설명 :특정 요양시설 상세조회
	*/
	@Override
	public NursingHomeVo getNursingHome(int nh_id) {
		return nursingHomeDao.getNursingHome(nh_id);
	}
	
	

}
