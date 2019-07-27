package kr.or.ddit.matching.matching.service;

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

}
