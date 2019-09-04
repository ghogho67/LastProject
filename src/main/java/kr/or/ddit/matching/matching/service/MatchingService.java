package kr.or.ddit.matching.matching.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.ddit.matching.matching.dao.IMatchingDao;
import kr.or.ddit.matching.matching.model.MatchingVo;

@Service
public class MatchingService implements IMatchingService {

	private static final Logger logger = LoggerFactory.getLogger(MatchingService.class);

	@Resource(name = "matchingDao")
	private IMatchingDao matchingDao;

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
		return matchingDao.matchingModify(mvo);
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
		return matchingDao.matchingDelete(mat_id);
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
		return matchingDao.getMatchingVo(mat_id);
	}

	/**
	* Method : matchingCreate
	* 작성자 : 정요한
	* 변경이력 :
	* @param vo
	* @return
	* Method 설명 :
	*/
	@Override
	public int matchingCreate(MatchingVo vo) {
		return matchingDao.matchingCreate(vo);
	}

	/**
	* Method : getMatchingList
	* 작성자 : 정요한
	* 변경이력 :
	* @param cw_mem_id
	* @return
	* Method 설명 : 요양보호사 매칭 리스트
	*/
	@Override
	public List<MatchingVo> getMatchingList(String cw_mem_id) {
		return matchingDao.getMatchingList(cw_mem_id);
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
		// TODO Auto-generated method stub
		return matchingDao.getCWMatchingList(cw_mem_id);
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
		// TODO Auto-generated method stub
		return matchingDao.getMemMatchingList(mem_id);
	}

	/**
	* Method : matchingPagingList
	* 작성자 : 정요한
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : 매칭 페이징
	*/
	@Override
	public Map<String, Object> matchingPagingList(Map<String, Object> map) {
		Map<String, Object> resultMap = new HashMap<String, Object>();

		if (map.get("mem_id") != null) {
			String mem_id = (String) map.get("mem_id");
			List<MatchingVo> matchingList = matchingDao.memMatchingPagingList(map);
			resultMap.put("matchingList", matchingList);
			int matchingCnt = matchingDao.memMatchingCnt(mem_id);
			resultMap.put("matchingCnt", matchingCnt);
			int pageSize = (int) map.get("pageSize");
			int paginationSize = (int) Math.ceil((double) matchingCnt / pageSize);
			resultMap.put("paginationSize", paginationSize);

		} else if (map.get("cw_mem_id") != null) {

			String cw_mem_id = (String) map.get("cw_mem_id");
			map.put("cw_mem_id", cw_mem_id);
			List<MatchingVo> matchingList = matchingDao.cwMatchingPagingList(map);
			resultMap.put("matchingList", matchingList);
			int matchingCnt = matchingDao.cwMatchingCnt(cw_mem_id);
			resultMap.put("matchingCnt", matchingCnt);
			int pageSize = (int) map.get("pageSize");
			int paginationSize = (int) Math.ceil((double) matchingCnt / pageSize);
			resultMap.put("paginationSize", paginationSize);
		}

		return resultMap;
	}

}
