package kr.or.ddit.member.member.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.page.model.PageVo;

@Repository
public class MemberDao implements IMemberDao {
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	@Override
	public List<MemberVo> getMemList() {
		return sqlSession.selectList("member.getMemList");
	}

	@Override
	public MemberVo getMemVo(String mem_id) {
		return sqlSession.selectOne("member.getMemVo", mem_id);
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
		return sqlSession.update("member.passUpdate", memInfo);
	}

	// 나머지 구현 필요한것들 구현 member.xml 만들어야되고 확인 해봐야한다.
	@Override
	public int updateMem(MemberVo memVo) {
		return sqlSession.update("member.updateMem", memVo);
	}

	@Override
	public int updatePMember(MemberVo memVo) {
		return sqlSession.update("member.updatePMember", memVo);
	}

	@Override
	public int withdrwalMember(MemberVo memVo) {
		return sqlSession.update("member.withdrwalMember", memVo);
	}

	@Override
	public List<MemberVo> memPagingList(PageVo pageVo) {
		return null;
	}

	@Override
	public List<MemberVo> getCwList() {
		return sqlSession.selectList("member.getCwList");
	}

	@Override
	public List<String> getCwaddr() {
		return sqlSession.selectList("member.getCwaddr");
	}

	@Override
	public List<String> getCwList2() {
		return sqlSession.selectList("member.getCwList2");
	}

}
