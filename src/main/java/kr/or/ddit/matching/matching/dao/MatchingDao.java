package kr.or.ddit.matching.matching.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.or.ddit.matching.matching.model.MatchingVo;
import kr.or.ddit.member.member.model.MemberVo;

@Repository
public class MatchingDao implements IMatchingDao {

	private static final Logger logger = LoggerFactory.getLogger(MatchingDao.class);

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	/**
	* Method : matchingCreate
	* 작성자 : 정요한
	* 변경이력 :
	* @param mvo
	* @return
	* Method 설명 : 매칭 create 
	*/
	@Override
	public int matchingCreate(MatchingVo mvo) {
		logger.debug("☞mvo:{}", mvo);
		return sqlSession.insert("matching.create", mvo);
	}

	/**
	* Method : matchingDelete
	* 작성자 : 정요한
	* 변경이력 :
	* @param mat_id
	* @return
	* Method 설명 : 매칭 삭제
	*/
	@Override
	public int matchingDelete(int mat_id) {
		return sqlSession.update("matching.delete", mat_id);
	}

	/**
	* Method : matchingModify
	* 작성자 : 정요한
	* 변경이력 :
	* @param mvo
	* @return
	* Method 설명 : 매칭 수정
	*/
	@Override
	public int matchingModify(MatchingVo mvo) {
		logger.debug("☞mvo:{}", mvo);
		return sqlSession.update("matching.modify", mvo);
	}

	/**
	* Method : getMatchingVo
	* 작성자 : 정요한
	* 변경이력 :
	* @param mat_id
	* @return
	* Method 설명 : 매칭 가져오기
	*/
	@Override
	public MatchingVo getMatchingVo(int mat_id) {
		return sqlSession.selectOne("matching.getMatchingVo", mat_id);
	}

	/**
	* Method : getMatchingList
	* 작성자 : 정요한
	* 변경이력 :
	* @param cw_mem_id
	* @return
	* Method 설명 : 매칭 불러오기
	*/
	@Override
	public List<MatchingVo> getMatchingList(String cw_mem_id) {
		return sqlSession.selectList("matching.getMatchingList", cw_mem_id);
	}

	/**
	* Method : getMemMatchingList
	* 작성자 : 정요한
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 회원 매칭 리스트
	*/
	@Override
	public List<MatchingVo> getMemMatchingList(String mem_id) {
		return sqlSession.selectList("matching.getMemMatchingList", mem_id);
	}

	/**
	* Method : getCWMatchingList
	* 작성자 : 정요한
	* 변경이력 :
	* @param cw_mem_id
	* @return
	* Method 설명 : 요양보호사 매칭 리스트
	*/
	@Override
	public List<MatchingVo> getCWMatchingList(String cw_mem_id) {
		return sqlSession.selectList("matching.getCWMatchingList", cw_mem_id);
	}

	/**
	* Method : cwMatchingPagingList
	* 작성자 : 정요한
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 요양보호사 페이징 리스트
	*/
	@Override
	public List<MatchingVo> cwMatchingPagingList(Map<String, Object> map) {
		logger.debug("☞map:{}",map);
		return sqlSession.selectList("matching.cwMatchingPagingList", map);
	}

	/**
	* Method : memMatchingPagingList
	* 작성자 : 정요한
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 회원 페이징 리스트
	*/
	@Override
	public List<MatchingVo> memMatchingPagingList(Map<String, Object> map) {
		return sqlSession.selectList("matching.memMatchingPagingList", map);
	}

	/**
	* Method : cwMatchingCnt
	* 작성자 : 정요한
	* 변경이력 :
	* @param cw_mem_id
	* @return
	* Method 설명 : 요양보호사 매칭 갯수
	*/
	@Override
	public int cwMatchingCnt(String cw_mem_id) {
		return sqlSession.selectOne("matching.cwMatchingCnt", cw_mem_id);
	}

	/**
	* Method : memMatchingCnt
	* 작성자 : 정요한
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 회원 매칭 갯수
	*/
	@Override
	public int memMatchingCnt(String mem_id) {
		return sqlSession.selectOne("matching.memMatchingCnt", mem_id);
	}

	@Override
	public List<MemberVo> getCareWorker() {
		return sqlSession.selectList("matching.getCareWorker");
	}

}
