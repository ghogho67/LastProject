package kr.or.ddit.member.member.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.page.model.PageVo;

@Repository
public class MemberDao implements IMemberDao{
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	@Override
	public List<MemberVo> getMemList() {
		return sqlSession.selectList("member.getMemList");
	}

	@Override
	public int deleteMem(String mem_id) {
		return sqlSession.update("member.deleteMem",mem_id);
	}

	@Override
	public MemberVo getMemVo(String mem_id) {
		return sqlSession.selectOne("member.getMemVo",mem_id);
	}

	@Override
	public int memberCnt() {
		return sqlSession.selectOne("member.memberCnt");
	}
	
	@Override
	public String getMem_Id(Map<String, String> memInfo) {
		return sqlSession.selectOne("member.getMem_Id", memInfo);
	}
	
	@Override
	public int passUpdate(Map<String, String> memInfo) {
		return sqlSession.update("member.passUpdate",memInfo);
	}
	
	
	//나머지 구현 필요한것들 구현 member.xml 만들어야되고 확인 해봐야한다.
	@Override
	public int updateMem(MemberVo memVo) {
		return sqlSession.update("member.updateMem",memVo);
	}

	
	@Override
	public int updatePMem(MemberVo memVo) {
		return sqlSession.update("member.updatePMem",memVo);
	}
	
	@Override
	public List<MemberVo> memPagingList(PageVo pageVo) {
		return null;
	}

	

	

	
}
