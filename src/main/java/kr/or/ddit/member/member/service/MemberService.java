package kr.or.ddit.member.member.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.member.member.dao.IMemberDao;
import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.page.model.PageVo;

@Service
public class MemberService implements IMemberService {
	@Resource(name = "memberDao")
	private IMemberDao memberDao;

	@Override
	public List<MemberVo> getMemList() {
		return memberDao.getMemList();
	}

	@Override
	public int deleteMem(String mem_id) {
		return memberDao.deleteMem(mem_id);
	}

	@Override
	public MemberVo getMemVo(String mem_id) {
		return memberDao.getMemVo(mem_id);
	}

	@Override
	public int memberCnt() {
		return 0;
	}

	@Override
	public int updateMem(MemberVo memVo) {
		return 0;
	}

	@Override
	public List<MemberVo> memPagingList(PageVo pageVo) {
		return null;
	}
}
