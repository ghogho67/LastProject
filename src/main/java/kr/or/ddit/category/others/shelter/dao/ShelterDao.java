package kr.or.ddit.category.others.shelter.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.category.others.shelter.model.ShelterVo;
import kr.or.ddit.page.model.PageVo;

@Repository
public class ShelterDao implements IShelterDao {
	
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	/**
	* Method : shelterList
	* 작성자 : ADMIN
	* 변경이력 :
	* @return
	* Method 설명 :무더위 쉼터 전체 조회
	*/
	@Override
	public List<ShelterVo> shelterList() {
		return sqlSession.selectList("shelter.shelterList");
	}


	/**
	* Method : shelterCnt
	* 작성자 : ADMIN
	* 변경이력 :
	* @return
	* Method 설명 :무더위 쉼터 전체 수 조회
	*/
	@Override
	public int shelterCnt() {
		return sqlSession.selectOne("shelter.shelterCnt");
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
	public List<ShelterVo> shelterPagingList(PageVo pageVo) {
		return sqlSession.selectList("shelter.shelterPagingList", pageVo);
	}

	/**
	* Method : shelterVo
	* 작성자 : ADMIN
	* 변경이력 :
	* @param sh_id
	* @return
	* Method 설명 : 특정 무더위 쉼터 조회
	*/
	@Override
	public ShelterVo getShelter(int sh_id) {
		return sqlSession.selectOne("shelter.getShelter", sh_id);
	}

	/**
	* Method : getAddShelterList
	* 작성자 : ADMIN
	* 변경이력 :
	* @param sh_add
	* @return
	* Method 설명 : 지역으로 검색한 무터위 쉼터 조회
	*/
	@Override
	public List<ShelterVo> getAddShelterList(String sh_add) {
		return sqlSession.selectList("shelter.getAddShelterList",sh_add);
	}
}
