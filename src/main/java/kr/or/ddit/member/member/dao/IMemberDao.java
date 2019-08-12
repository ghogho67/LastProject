package kr.or.ddit.member.member.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.gold.gold.model.GoldVo;
import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.page.model.PageVo;

public interface IMemberDao {
	
	/**
	 * Method : getMemList
	 * 작성자 : PC21
	 * 변경이력 : 
	 * @return
	 * Method 설명 : 사용자 전체 리스트 조회
	 */
	List<MemberVo> getMemList();
	

	
	/**
	 * Method : getMemVo
	 * 작성자 : PC21
	 * 변경이력 :
	 * @param mem_id
	 * @return
	 * Method 설명 : 사용자 정보조회
	 */
	MemberVo getMemVo(String mem_id);
	
	
	
	/**
	 * Method : memberCnt
	 * 작성자 : PC21
	 * 변경이력 :
	 * @return
	 * Method 설명 : 사용자 전체수 조회
	 */
	int memberCnt();
	
	/**
	 * Method : updateMem
	 * 작성자 : PC21
	 * 변경이력 :
	 * @param userVo
	 * @return
	 * Method 설명 :사용자 업데이트
	 */
	int updateMem(MemberVo memVo);
	
	
	
	
	
	/**
	 * Method : updatePMember
	 * 작성자 : PC02
	 * 변경이력 :
	 * @param userVo
	 * @return
	 * Method 설명 :사용자(대상자) 업데이트
	 */
	int updatePMember(MemberVo memVo);
	
	
	
	/**
	 * Method : updateMem
	 * 작성자 : PC02
	 * 변경이력 :
	 * @param userVo
	 * @return
	 * Method 설명 :사용자 탈퇴
	 */
	int withdrwalMember(MemberVo memVo);
	
	
	
	/**
	 * Method : memPagingList
	 * 작성자 : PC21
	 * 변경이력 :
	 * @param pageVo
	 * @return
	 * Method 설명 : 사용자 페이징 
	 */
	List<MemberVo> memPagingList(PageVo pageVo);


	/**
	 * Method : getMemVo
	 * 작성자 : PC21
	 * 변경이력 :
	 * @param mem_id
	 * @return
	 * Method 설명 : 아이디찾기 정보 조회
	 */
	String getMem_Id(Map<String, String> memInfo);
	
	/**
	 * Method : getMemVo
	 * 작성자 : PC21
	 * 변경이력 :
	 * @param mem_id
	 * @return
	 * Method 설명 : 비밀번호 찾기 임시비밀번호 업데이트
	 */
	int passUpdate(Map<String, String> memInfo);

	//요양보호사리스트 조회
	List<MemberVo> getCwList();
	
	//요양보호사리스트 조회
	List<String> getCwaddr();
	
	List<String> getCwList2();

	// 회원테이블의 등급을 골드회원으로 변경
	int upgradeMemberStep1(String mem_id);

	// 골드테이블에 정보입력
	int upgradeMemberStep2(String mem_id);
	int upgradeMemberStep3(String mem_id);

	// <!-- 프리미엄혜택이 끝나는 회원을 조회한다 -->
	List<String> downGradeMemberStep1();

	// <!-- 프리미엄혜택이 끝나는 회원의 등급을 조정한다 -->
	int downGradeMemberStep2(String mem_id);

//<!-- 프리미엄혜택이 끝나는 회원의 gold서비스 이력을 조정한다  -->
	int downGradeMemberStep3(String mem_id);
	
	
	GoldVo downGradeMember(String mem_id);
	
}
