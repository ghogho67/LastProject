package kr.or.ddit.member.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.gold.gold.model.GoldVo;
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



	@Override
	public List<MemberVo> getCwList() {
		return memberDao.getCwList();
	}



	@Override
	public List<String> getCwaddr() {
		return memberDao.getCwaddr();
	}



	@Override
	public List<String> getCwList2() {
		return memberDao.getCwList2();
	}



	
	public int upgradeMemberStep1(String mem_id) {
		return memberDao.upgradeMemberStep1(mem_id);
	}



	@Override
	public int upgradeMemberStep2(String mem_id) {
		return memberDao.upgradeMemberStep2(mem_id);
	}



	@Override
	public GoldVo downGradeMemberStep1(String mem_id) {
		return memberDao.downGradeMemberStep1(mem_id);
	}



	@Override
	public int downGradeMemberStep2(String mem_id) {
		return memberDao.downGradeMemberStep2(mem_id);
	}



	@Override
	public int downGradeMemberStep3(String mem_id) {
		return memberDao.downGradeMemberStep3(mem_id);
	}



	@Override
	public GoldVo downGradeMember(String mem_id) {
		return memberDao.downGradeMember(mem_id);
	}


	//골드회원에 가입한적이 있는 경우  업데이트한다
	@Override
	public int upgradeMemberStep3(String mem_id) {
		// TODO Auto-generated method stub
		return memberDao.upgradeMemberStep3(mem_id);
	}



	/**
	* Method : getAllMemberList
	* 작성자 : ADMIN
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 :전체 사용자 페이징 리스트
	*/
	@Override
	public Map<String, Object> getAllMemberList(PageVo pageVo) {
		
		Map<String, Object> resultMap = new HashMap<String , Object>();
		resultMap.put("getMemList", memberDao.getAllMemberList(pageVo));
		
		int memberCnt = memberDao.memberCnt();
		int paginationSize = (int) Math.ceil((double)memberCnt/pageVo.getPageSize());
		resultMap.put("lastpaginationSize", paginationSize);
		
		return resultMap;
	}



	/**
	* Method : memberGradeCnt
	* 작성자 : ADMIN
	* 변경이력 :
	* @return
	* Method 설명 : 회원등급간 수 
	*/
	@Override
	public int memberGradeCnt(String mem_grade) {
		return memberDao.memberGradeCnt(mem_grade);
	}



	@Override
	public int updatePMemberNoPro(MemberVo memberVo) {
		return memberDao.updatePMemberNoPro(memberVo);
	}



	@Override
	public int updateMemberNoPro(MemberVo updateMember) {
		return memberDao.updateMemberNoPro(updateMember);
	}



}
