package kr.or.ddit.member.member.service;

import java.util.List;
import java.util.Map;

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
	public MemberVo getMemVo(String mem_id) {
		return memberDao.getMemVo(mem_id);
	}

	@Override
	public int memberCnt() {
		return 0;
	}

	@Override
	public int updateMember(MemberVo memVo) {
		return memberDao.updateMem(memVo);
	}
	
	
	@Override
	public int updatePMember(MemberVo memVo) {
		return memberDao.updatePMember(memVo);
	}
	
	

	@Override
	public List<MemberVo> memPagingList(PageVo pageVo) {
		return null;
	}
	
	
	
	@Override
	public int withdrwalMember(MemberVo memVo) {
		return memberDao.withdrwalMember(memVo);
	}
	



	@Override
	public String getMem_Id(Map<String, String> memInfo) {
		return memberDao.getMem_Id(memInfo);
	}

	@Override
	public int passUpdate(Map<String, String> memInfo) {
		return memberDao.passUpdate(memInfo);
	}



}
