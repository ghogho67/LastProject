package kr.or.ddit.register.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.encrypt.kisa.sha256.KISA_SHA256;
import kr.or.ddit.member.diseaseName.model.DiseaseNameVo;
import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.member.memberDisease.model.MemberDiseaseVo;
import kr.or.ddit.register.service.IRegisterService;
import kr.or.ddit.util.PartUtil;

@RequestMapping("/regist")
@Controller
public class RegisterController {

	@Resource(name = "registerService")
	public IRegisterService registerService;

	/**
	 * Method : regist 작성자 : ADMIN 변경이력 :
	 * 
	 * @return Method 설명 : 로그인 화면요청
	 */
	@RequestMapping(path = "/regist1", method = RequestMethod.GET)
	public String regist() {

		return "/regist/registrationStep1_TypeSelect";
	}

	/**
	 * Method : regist1 작성자 : ADMIN 변경이력 :
	 * 
	 * @return Method 설명 : 로그인 화면 처리
	 */
	@RequestMapping(path = "/regist1", method = RequestMethod.POST)
	public String regist1() {

		return "/regist/registrationStep1_TypeSelect";
	}

	/**
	 * Method : registNotice 작성자 : ADMIN 변경이력 :
	 * 
	 * @return Method 설명 : 일반회원 약관 요청
	 */
	@RequestMapping(path = "/regist2", method = RequestMethod.GET)
	public String registNotice() {

		return "/regist/registrationStep2_Regulation";
	}

	/**
	 * Method : registNotice1 작성자 : ADMIN 변경이력 :
	 * 
	 * @return Method 설명 :일반회원 약관 동의
	 */
	@RequestMapping(path = "/regist2", method = RequestMethod.POST)
	public String registNotice1() {

		return "/regist/registrationStep2_Regulation";
	}

	/**
	 * Method : registNotice1 작성자 : ADMIN 변경이력 :
	 * 
	 * @return Method 설명 :일반회원 정보입력 요청
	 */
	@RequestMapping(path = "/regist3", method = RequestMethod.GET)
	public String insertRegist() {

		return "/regist/registrationStep3_Form";
	}

	/**
	 * Method : insertRegist1 작성자 : ADMIN 변경이력 :
	 * 
	 * @return Method 설명 :일반회원 정보입력
	 */
	@RequestMapping(path = "/regist3", method = RequestMethod.POST)
	public String insertRegist1(Model model, MemberVo memberVo, BindingResult result, MemberDiseaseVo memberDiseaseVo,
			MultipartFile profile, String mem_id) {

		memberVo = new MemberVo();
		memberDiseaseVo = new MemberDiseaseVo();
		
		int insertMemberCnt = registerService.insertMember(memberVo);
		int insertMemberdieseaseCnt = registerService.insertMemberDisease(memberDiseaseVo);
		
		
		
		return "/regist/registrationStep3_Form";
	}

	/**
	 * Method : registMember 작성자 : ADMIN 변경이력 :
	 * 
	 * @return Method 설명 :요양보호사 약관 동의 요청
	 */
	@RequestMapping(path = "/regist2-1", method = RequestMethod.GET)
	public String registCWMember() {

		return "/regist/registrationStep2-1_Regulation";
	}

	/**
	 * Method : registCWMember1 작성자 : ADMIN 변경이력 :
	 * 
	 * @return Method 설명 :요양보호사 약관 동의 처리
	 */
	@RequestMapping(path = "/regist2-1", method = RequestMethod.POST)
	public String registCWMember1() {

		return "/regist/registrationStep2-1_Regulation";
	}

	/**
	 * Method : registCWMember1 작성자 : ADMIN 변경이력 :
	 * 
	 * @return Method 설명 :요양보호사 정보입력 요청
	 */
	@RequestMapping(path = "/regist3-1", method = RequestMethod.GET)
	public String insertCWRegist() {

		return "/regist/registrationStep3-1_Form";
	}

	/**
	 * Method : insertCWRegist1 작성자 : ADMIN 변경이력 :
	 * 
	 * @return Method 설명 :요양보호사 정보입력 처리
	 */
	@RequestMapping(path = "/regist3-1", method = RequestMethod.POST)
	public String insertCWRegist1() {

		return "/regist/registrationStep3-1_Form";
	}

	/**
	 * Method : registComplete 작성자 : ADMIN 변경이력 :
	 * 
	 * @return Method 설명 : 회원가입 입력 성공 요청
	 */
	@RequestMapping(path = "/regist4", method = RequestMethod.GET)
	public String registComplete() {

		return "/regist/registrationStep4_Complete";
	}

	/**
	 * Method : registComplete1 작성자 : ADMIN 변경이력 :
	 * 
	 * @return Method 설명 :회원가입 입력 성공 처리
	 */
	@RequestMapping(path = "/regist4", method = RequestMethod.POST)
	public String registComplete1() {

		return "/regist/registrationStep4_Complete";
	}

}
