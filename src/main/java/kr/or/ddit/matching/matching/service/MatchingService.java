package kr.or.ddit.matching.matching.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.matching.matching.dao.IMatchingDao;
import kr.or.ddit.matching.matching.model.MatchingVo;

@Service
public class MatchingService implements IMatchingService {

	@Resource(name = "matchingDao")
	private IMatchingDao matchingDao;
//
//	@Override
//	public List<MatchingVo> getMatchingList(String mem_id) {
//		return matchingDao.getMatchingList(mem_id);
//	}
//
//	@Override
//	public MatchingVo getMatching(String mat_id) {
//		return matchingDao.getMatching(mat_id);
//	}
//
//	@Override
//	public int insertCalendar(MatchingVo vo) {
//		return matchingDao.insertCalendar(vo);
//	}
//
//	@Override
//	public List<MatchingVo> getCalendar() {
//		return matchingDao.getCalendar();
//	}
//
//	@Override
//	public int updateCalendar(MatchingVo vo) {
//		return matchingDao.updateCalendar(vo);
//	}
////
//	@Override
//	public int deleteCalendar(int c_id) {
//		return matchingDao.deleteCalendar(c_id);
//	}

	@Override
	public int matchingModify(MatchingVo mvo) {
		return matchingDao.matchingModify(mvo);
	}

	@Override
	public int matchingDelete(int mat_id) {
		return matchingDao.matchingDelete(mat_id);
	}

	@Override
	public MatchingVo getMatchingVo(int mat_id) {
		return matchingDao.getMatchingVo(mat_id);
	}

	@Override
	public int matchingCreate(MatchingVo vo) {
		return matchingDao.matchingCreate(vo);
	}

	@Override
	public List<MatchingVo> getMatchingList(String cw_mem_id) {
		return matchingDao.getMatchingList(cw_mem_id);
	}

	@Override
	public List<MatchingVo> getCWMatchingList(String cw_mem_id) {
		// TODO Auto-generated method stub
		return matchingDao.getCWMatchingList(cw_mem_id);
	}

	@Override
	public List<MatchingVo> getMemMatchingList(String mem_id) {
		// TODO Auto-generated method stub
		return matchingDao.getMemMatchingList(mem_id);
	}

	@Override
	public Map<String, Object> matchingPagingList(Map<String, Object> map) {
		Map<String, Object> resultMap = new HashMap<String, Object>();

		if (map.get("mem_id") != null) {
			String mem_id = (String) map.get("mem_id");
			List<MatchingVo> matchingList = matchingDao.memMatchingPagingList(map);
			resultMap.put("matchingList", matchingList);
			int matchingCnt = matchingDao.cwMatchingCnt(mem_id);
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
