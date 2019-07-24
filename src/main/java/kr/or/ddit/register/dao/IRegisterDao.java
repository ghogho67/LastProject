package kr.or.ddit.register.dao;

import kr.or.ddit.member.careWorker.career.model.CareerVo;
import kr.or.ddit.member.careWorker.day.model.DayVo;
import kr.or.ddit.member.careWorker.hospital.model.HospitalVo;
import kr.or.ddit.member.careWorker.location.model.LocationVo;
import kr.or.ddit.member.careWorker.serviceType.model.ServiceTypeVo;
import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.member.memberDisease.model.MemberDiseaseVo;

public interface IRegisterDao {
	
	/**
	* Method : insertMember
	* 작성자 : ADMIN
	* 변경이력 :
	* @param memVo
	* @return
	* Method 설명 : 일반회원 가입
	*/
	int insertMember(MemberVo memberVo);
	
	
	/**
	* Method : insertMemberDisease
	* 작성자 : ADMIN
	* 변경이력 :
	* @param memberDiseaseVo
	* @return
	* Method 설명 : 일반회원 가입 - 질병명
	*/
	int insertMemberDisease(MemberDiseaseVo memberDiseaseVo);

	//--------------------------------------------------
	
	/**
	* Method : insertCWMember
	* 작성자 : ADMIN
	* 변경이력 :
	* @param memberVo
	* @return
	* Method 설명 :요양보호사 회원가입
	*/
	int insertCWMember(MemberVo memberVo);
	
	/**
	* Method : insertLocation
	* 작성자 : ADMIN
	* 변경이력 :
	* @param locationVo
	* @return
	* Method 설명 :요양보호사 등록 - 서비스 지역
	*/
	int insertLocation(LocationVo locationVo);
	
	/**
	* Method : insertDay
	* 작성자 : ADMIN
	* 변경이력 :
	* @param dayVo
	* @return
	* Method 설명 :요양보호사 등록 - 가능요일
	*/
	int insertDay(DayVo dayVo);
	
	/**
	* Method : insertCareer
	* 작성자 : ADMIN
	* 변경이력 :
	* @param careerVo
	* @return
	* Method 설명 :요양보호사 등록 - 경력
	*/
	int insertCareer(CareerVo careerVo);
	
	/**
	* Method : insertHospital
	* 작성자 : ADMIN
	* 변경이력 :
	* @param hospitalVo
	* @return
	* Method 설명 :요양보호사 등록 - 경력 - 병원명
	*/
	int insertHospital(HospitalVo hospitalVo);
	
	/**
	* Method : insertServiceType
	* 작성자 : ADMIN
	* 변경이력 :
	* @param serviceTypeVo
	* @return
	* Method 설명 :요양보호사 증록 - 서비스 종류
	*/
	int insertServiceType(ServiceTypeVo serviceTypeVo);
	
	
	
	
	
}
