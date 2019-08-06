package kr.or.ddit.category.others.nursingHome.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.category.others.nursingHome.model.NursingHomeVo;
import kr.or.ddit.page.model.PageVo;

@Repository
public class NursingHomeDao implements INursingHomeDao {

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	/**
	* Method : nursingList
	* 작성자 : ADMIN
	* 변경이력 :
	* @return
	* Method 설명 :요양시설 전체 리스트 조회
	*/
	@Override
	public List<NursingHomeVo> nursingList() {
		return sqlSession.selectList("nursingHome.nursingList");
	}

	/**
	* Method : nursingCnt
	* 작성자 : ADMIN
	* 변경이력 :
	* @return
	* Method 설명 :요양시설 전체 수 조회
	*/
	@Override
	public int nursingCnt() {
		return sqlSession.selectOne("nursingHome.nursingCnt");
	}

	/**
	* Method : nursingPagingList
	* 작성자 : ADMIN
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 :요양시설 페이지 처리
	*/
	@Override
	public List<NursingHomeVo> nursingPagingList(PageVo pageVo) {
		return sqlSession.selectList("nursingHome.nursingPagingList",pageVo);
	}

	/**
	* Method : searchNursingHome
	* 작성자 : ADMIN
	* 변경이력 :
	* @param nh_add
	* @return
	* Method 설명 :요양시설 지역검색후 리스트 조회 (높은 평점 순)
	*/
	@Override
	public List<NursingHomeVo> searchNursingHome(String nh_add) {
		return sqlSession.selectList("nursingHome.searchNursingHome",nh_add);
	}

	/**
	* Method : getNursingHome
	* 작성자 : ADMIN
	* 변경이력 :
	* @param nh_id
	* @return
	* Method 설명 :특정 요양시설 상세보기
	*/
	@Override
	public NursingHomeVo getNursingHome(int nh_id) {
		return sqlSession.selectOne("nursingHome.getNursingHome", nh_id);
	}
	
	
	
}
