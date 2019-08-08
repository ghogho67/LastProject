package kr.or.ddit.member.careWorker.hospital.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.member.careWorker.hospital.model.HospitalVo;
import kr.or.ddit.page.model.PageVo;


@Repository
public class HospitalDao implements IHospitalDao{
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	/**
	* Method : hosList
	* 작성자 : ADMIN
	* 변경이력 :
	* @param 
	* @return
	* Method 설명 : 병원 전체 리스트 조회
	*/
	@Override
	public List<HospitalVo> hosList() {
		return sqlSession.selectList("hospital.hosList");
	}

	/**
	* Method : hosPagingList
	* 작성자 : ADMIN
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 병원 페이징리스트
	*/
	@Override
	public List<HospitalVo> hosPagingList(PageVo pageVo) {
		return sqlSession.selectList("hospital.hosPagingList", pageVo);
	}

	/**
	* Method : hosCnt
	* 작성자 : ADMIN
	* 변경이력 :
	* @param 
	* @return
	* Method 설명 : 전체 병원수 조회
	*/
	@Override
	public int hosCnt() {
		return sqlSession.selectOne("hospital.hosCnt");
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
		return sqlSession.selectOne("hospital.getHospital", hos_id);
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
		return sqlSession.selectList("hospital.getSearchHosAdd", hos_add);
	}
	
	
	/**
	* Method : searchHosPagingList
	* 작성자 : ADMIN
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : 지역검색 페이징 리스트
	*/
	@Override
	public List<HospitalVo> searchHosPagingList(Map<String, Object> map) {
		return sqlSession.selectList("hospital.searchHosPagingList", map);
	}


	/**
	* Method : searchHosCnt
	* 작성자 : ADMIN
	* 변경이력 :
	* @return
	* Method 설명 :지역검색 병원 수
	*/
	@Override
	public int searchHosCnt(String hos_add) {
		return sqlSession.selectOne("hospital.searchHosCnt",hos_add);
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
	public List<String> searchMapList(String hos_add) {
		return sqlSession.selectList("hospital.searchMapList",hos_add);
	}

	
	
	
}
