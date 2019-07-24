package kr.or.ddit.register.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.member.careWorker.career.model.CareerVo;
import kr.or.ddit.member.careWorker.day.model.DayVo;
import kr.or.ddit.member.careWorker.hospital.model.HospitalVo;
import kr.or.ddit.member.careWorker.location.model.LocationVo;
import kr.or.ddit.member.careWorker.serviceType.model.ServiceTypeVo;
import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.member.memberDisease.model.MemberDiseaseVo;

@Repository
public class RegisterDao implements IRegisterDao {

	@Resource(name="sqlSession")
	private SqlSessionTemplate sqlSession;
	
	/**
	* Method : insertMember
	* 작성자 : ADMIN
	* 변경이력 :
	* @param memVo
	* @return
	* Method 설명 : 회원가입
	*/
	@Override
	public int insertMember(MemberVo memberVo) {
		return sqlSession.insert("member.insertMember", memberVo);
	}

	/**
	* Method : insertMemberDisease
	* 작성자 : ADMIN
	* 변경이력 :
	* @param memberDiseaseVo
	* @return
	* Method 설명 : 일반회원 가입 - 질병명
	*/
	@Override
	public int insertMemberDisease(MemberDiseaseVo memberDiseaseVo) {
		return sqlSession.insert("member.insertMemberDisease",memberDiseaseVo);
	}

	//---------------------------------------------------------------------
	
	/**
	* Method : insertCWMember
	* 작성자 : ADMIN
	* 변경이력 :
	* @param memberVo
	* @return
	* Method 설명 :요양보호사 회원가입
	*/
	@Override
	public int insertCWMember(MemberVo memberVo) {
		return sqlSession.insert("member.insertCWMember", memberVo);
	}

	/**
	* Method : insertLocation
	* 작성자 : ADMIN
	* 변경이력 :
	* @param locationVo
	* @return
	* Method 설명 :요양보호사 등록 - 서비스 지역
	*/
	@Override
	public int insertLocation(LocationVo locationVo) {
		return sqlSession.insert("member.insertLocation", locationVo);
	}

	/**
	* Method : insertDay
	* 작성자 : ADMIN
	* 변경이력 :
	* @param dayVo
	* @return
	* Method 설명 :요양보호사 등록 - 가능요일
	*/
	@Override
	public int insertDay(DayVo dayVo) {
		return sqlSession.insert("member.insertDay", dayVo);
	}

	/**
	* Method : insertCareer
	* 작성자 : ADMIN
	* 변경이력 :
	* @param careerVo
	* @return
	* Method 설명 :요양보호사 등록 - 경력
	*/
	@Override
	public int insertCareer(CareerVo careerVo) {
		return sqlSession.insert("member.insertCareer", careerVo);
	}

	/**
	* Method : insertHospital
	* 작성자 : ADMIN
	* 변경이력 :
	* @param hospitalVo
	* @return
	* Method 설명 :요양보호사 등록 - 경력 - 병원명
	*/
	@Override
	public int insertHospital(HospitalVo hospitalVo) {
		return sqlSession.insert("member.insertHospital", hospitalVo);
	}

	/**
	* Method : insertServiceType
	* 작성자 : ADMIN
	* 변경이력 :
	* @param serviceTypeVo
	* @return
	* Method 설명 :요양보호사 증록 - 서비스 종류
	*/
	@Override
	public int insertServiceType(ServiceTypeVo serviceTypeVo) {
		return sqlSession.insert("member.insertServiceType", serviceTypeVo);
	}

	//-------------------------------------------------------
	
	/**
	* Method : idCheck
	* 작성자 : ADMIN
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 : 아이디 중복체크
	*/
	@Override
	public int idCheck(String mem_id) {
		return sqlSession.selectOne("member.idCheck", mem_id);
	}

	/**
	* Method : getMemVo
	* 작성자 : ADMIN
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 :특정사용자 조회
	*/
	@Override
	public MemberVo getMemVo(String mem_id) {
		return sqlSession.selectOne("member.getMemVo",mem_id);
	}

}
