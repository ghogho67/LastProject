package kr.or.ddit.register.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.member.careWorker.career.model.CareerVo;
import kr.or.ddit.member.careWorker.cwServiceType.model.CwServiceTypeVo;
import kr.or.ddit.member.careWorker.day.model.DayVo;
import kr.or.ddit.member.careWorker.hospital.model.HospitalVo;
import kr.or.ddit.member.careWorker.location.model.LocationVo;
import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.member.memberDisease.model.MemberDiseaseVo;
import kr.or.ddit.register.dao.IRegisterDao;

@Service
public class RegisterService implements IRegisterService {

	@Resource(name = "registerDao")
	private IRegisterDao registerDao;

	
	/**
	* Method : insertMember
	* 작성자 : ADMIN
	* 변경이력 :
	* @param memVo
	* @return
	* Method 설명 : 일반회원 가입
	*/
	@Override
	public int insertMember(MemberVo memberVo) {
		return registerDao.insertMember(memberVo);
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
		return registerDao.insertMemberDisease(memberDiseaseVo);
	}

	//-------------------------------------------------------------------------
	
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
		return registerDao.insertCWMember(memberVo);
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
		return registerDao.insertLocation(locationVo);
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
		return registerDao.insertDay(dayVo);
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
		return registerDao.insertCareer(careerVo);
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
		return registerDao.insertHospital(hospitalVo);
	}


	/**
	* Method : insertCWServiceType
	* 작성자 : ADMIN
	* 변경이력 :
	* @param cwServiceTypeVo
	* @return
	* Method 설명 :요양보호사 증록 - 서비스 종류
	*/
	@Override
	public int insertCWServiceType(CwServiceTypeVo cwServiceTypeVo) {
		return registerDao.insertCWServiceType(cwServiceTypeVo);
	}

	
	//-----------------------------------------------------

	/**
	* Method : idCheck
	* 작성자 : ADMIN
	* 변경이력 :
	* @param mem_id
	* @return
	* Method 설명 :아이디 중복체크
	*/
	@Override
	public int idCheck(String mem_id) {
		return registerDao.idCheck(mem_id);
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
		return registerDao.getMemVo(mem_id);
	}




}
