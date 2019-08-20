package kr.or.ddit.member.member.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.gold.gold.model.GoldVo;
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

	@Override
	public String getProfile(String mem_id) {
		return sqlSession.selectOne("member.getProfile",mem_id);
	}
	//<!-- 골드회원으로 변경  -->
	@Override
	public int upgradeMemberStep1(String mem_id) {
		return sqlSession.update("member.upgradeMemberStep1", mem_id);
	}
	// 골드테이블에 정보입력
	@Override
	public int upgradeMemberStep2(String mem_id) {
		return sqlSession.insert("member.upgradeMemberStep2",mem_id);
	}

//<!-- 프리미엄혜택이 끝나는 회원을 조회한다  -->
	@Override
	public List<String> downGradeMemberStep1() {
		return sqlSession.selectList("member.downGradeMemberStep1");
	}
//	<!-- 프리미엄혜택이 끝나는 회원의 등급을 조정한다   -->
	@Override
	public int downGradeMemberStep2(String mem_id) {
		return sqlSession.update("member.downGradeMemberStep2", mem_id);
	}
	@Override
	public int downGradeMemberStep3(String mem_id) {
		return sqlSession.update("member.downGradeMemberStep3", mem_id);
	}

	@Override
	public GoldVo downGradeMember(String mem_id) {
		return sqlSession.selectOne("member.downGradeMember", mem_id);
	}
	//골드회원에 가입한적이 있는 경우  업데이트한다
	@Override
	public int upgradeMemberStep3(String mem_id) {
		return sqlSession.update("member.upgradeMemberStep3", mem_id);
	}

	/**
	* Method : getAllMemberList
	* 작성자 : ADMIN
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 :전체 회원 페이징 리스트
	*/
	@Override
	public List<MemberVo> getAllMemberList(PageVo pageVo) {
		return sqlSession.selectList("member.getAllMemberList",pageVo);
	}

}
