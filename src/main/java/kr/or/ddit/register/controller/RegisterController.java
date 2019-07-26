package kr.or.ddit.register.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.member.careWorker.career.model.CareerVo;
import kr.or.ddit.member.careWorker.cwServiceType.model.CwServiceTypeVo;
import kr.or.ddit.member.careWorker.day.model.DayVo;
import kr.or.ddit.member.careWorker.hospital.model.HospitalVo;
import kr.or.ddit.member.careWorker.location.model.LocationVo;
import kr.or.ddit.member.careWorker.serviceType.model.ServiceTypeVo;
import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.member.memberDisease.model.MemberDiseaseVo;
import kr.or.ddit.register.service.IRegisterService;
import kr.or.ddit.util.PartUtil;
import kr.or.ddit.util.RegCheck;

@RequestMapping("/regist")
@Controller
public class RegisterController {
	private static final Logger logger = LoggerFactory.getLogger(RegisterController.class);
	@Resource(name = "registerService")
	public IRegisterService registerService;
	@Resource(name = "regCheck")
	public RegCheck regCheck;

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
	 * Method : idCheck 작성자 : ADMIN 변경이력 :
	 * 
	 * @return Method 설명 :아이디 중복체크 요청
	 */
//	@RequestMapping(path = "/idCheck", method = RequestMethod.GET)
//	public String idCheck() {
//		
//		return "/regist/registrationStep3_Form";
//	}

	/**
	 * Method : idCheck 작성자 : ADMIN 변경이력 :
	 * 
	 * @param mem_id
	 * @param model
	 * @return Method 설명 : 아이디 중복체크 처리, 정규식 처리
	 */
	@RequestMapping(path = "/idCheck")
	public String idCheck(String mem_id, Model model) {

		logger.debug("!!!!!mem_id : {}", mem_id);
		String str = "";
		int idCnt = registerService.idCheck(mem_id);
		
		boolean idCheck = regCheck.regId(mem_id);
		logger.debug("!!!! idCheck : {} ",idCheck);
		if(idCheck==false) {
			logger.debug("!!!! 정규식 에러");
			model.addAttribute("mem_id", "mem_id");
			return "jsonView";
		}

		if (idCnt == 1) {
			str = "no"; // 존재
		} else {
			str = "yes"; // 사용가능
		}

		logger.debug("!!!!!str : {}", str);
		model.addAttribute("mem_id", str);

		return "jsonView";
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
	@ResponseBody
	public String insertRegist1(Model model, MemberVo memberVo, String frmData, BindingResult result,
			MemberDiseaseVo memberDiseaseVo, MultipartFile profile, RedirectAttributes redirectAttributes) {
		logger.debug("!!!! 컨트롤러 도착");
		logger.debug("!!!! memberVo : {} ", memberVo);
//		logger.debug("!!!! mem_id : {} ", mem_id);

		

		String str ="";

		boolean passCheck = regCheck.regPass(memberVo.getMem_pass());
		if(passCheck==false) {
			str = "비밀번호를 정규식에 맞게 입력해 주세요";
			model.addAttribute("data", str);
			return "mem_pass";
		}
		boolean nameCheck = regCheck.regName(memberVo.getMem_nm());
		if(nameCheck==false) {
			str = "이름을 정규식에 맞게 입력해 주세요";
			model.addAttribute("data", str);
			return "mem_nm";
		}
		boolean phoneCheck = regCheck.regPhone(memberVo.getMem_phone());
		if(phoneCheck==false) {
			str = "핸드폰을 정규식에 맞게 입력해 주세요";
			model.addAttribute("data", str);
			return "mem_phone";
		}
		boolean mailCheck = regCheck.regMail(memberVo.getMem_mail());
		if(mailCheck==false) {
			str = "이메일을 정규식에 맞게 입력해 주세요";
			model.addAttribute("data", str);
			return "mem_mail";
		}

		memberVo.setMem_id(memberVo.getMem_id());
		memberVo.setMem_pass(memberVo.getMem_pass());
		memberVo.setMem_nm(memberVo.getMem_nm());
		memberVo.setMem_phone(memberVo.getMem_phone());
		memberVo.setMem_mail(memberVo.getMem_mail());
		memberVo.setMem_birth(memberVo.getMem_birth());
		memberVo.setMem_add1(memberVo.getMem_add1());
		memberVo.setMem_add2(memberVo.getMem_add2());
		memberVo.setMem_zipcd(memberVo.getMem_zipcd());
		memberVo.setMem_photo_path(memberVo.getMem_photo_path());
		memberVo.setMem_photo_nm(memberVo.getMem_photo_nm());
		memberVo.setPro_relation(memberVo.getPro_relation());
		memberVo.setPro_nm(memberVo.getPro_nm());
		memberVo.setPro_phone(memberVo.getPro_phone());
		memberVo.setMem_gender(memberVo.getMem_gender());
		
		int insertMemberCnt = registerService.insertMember(memberVo);

		memberDiseaseVo.setMem_dis_id(memberDiseaseVo.getMem_dis_id());
		memberDiseaseVo.setDis_id(memberDiseaseVo.getDis_id());
		
		memberDiseaseVo.setMem_id(memberVo.getMem_id());
		
		logger.debug("memberDiseaseVo :{}",memberDiseaseVo);

		int insertMemberdieseaseCnt = registerService.insertMemberDisease(memberDiseaseVo);

		
		if (insertMemberCnt == 1 && insertMemberdieseaseCnt == 1) {
			
			logger.debug("insertMemberCnt == 1 && insertMemberdieseaseCnt == 1 :{}", insertMemberCnt == 1 && insertMemberdieseaseCnt == 1);
			return "success";
		}else {
			return "false";
		}

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
	public String insertCWRegist1(Model model, MemberVo memberVo, String frmData, BindingResult result,LocationVo locationVo, DayVo dayVo, 
			CareerVo careerVo, HospitalVo hospitalVo, CwServiceTypeVo cwServiceTypeVo, MultipartFile profile, RedirectAttributes redirectAttributes) {

		String str ="";

		boolean passCheck = regCheck.regPass(memberVo.getMem_pass());
		if(passCheck==false) {
			str = "비밀번호를 정규식에 맞게 입력해 주세요";
			model.addAttribute("data", str);
			return "mem_pass";
		}
		boolean nameCheck = regCheck.regName(memberVo.getMem_nm());
		if(nameCheck==false) {
			str = "이름을 정규식에 맞게 입력해 주세요";
			model.addAttribute("data", str);
			return "mem_nm";
		}
		boolean phoneCheck = regCheck.regPhone(memberVo.getMem_phone());
		if(phoneCheck==false) {
			str = "핸드폰을 정규식에 맞게 입력해 주세요";
			model.addAttribute("data", str);
			return "mem_phone";
		}
		boolean mailCheck = regCheck.regMail(memberVo.getMem_mail());
		if(mailCheck==false) {
			str = "이메일을 정규식에 맞게 입력해 주세요";
			model.addAttribute("data", str);
			return "mem_mail";
		}
		
		//프로필 사진 넣어야함!!!
		
		
		
		
		memberVo.setMem_photo_nm(memberVo.getMem_photo_nm());
		memberVo.setMem_photo_path(memberVo.getMem_photo_path());
		memberVo.setMem_id(memberVo.getMem_id());
		memberVo.setMem_pass(memberVo.getMem_pass());
		memberVo.setMem_nm(memberVo.getMem_nm());
		memberVo.setMem_phone(memberVo.getMem_phone());
		memberVo.setMem_mail(memberVo.getMem_mail());
		memberVo.setMem_birth(memberVo.getMem_birth());
		memberVo.setCw_lic(memberVo.getCw_lic());
		memberVo.setCw_driver(memberVo.getCw_driver());
		memberVo.setMem_gender(memberVo.getMem_gender());
		
		int insertCWMemberCnt = registerService.insertCWMember(memberVo);
		
		locationVo.setLoc_dong(locationVo.getLoc_dong());
		locationVo.setLoc_id(locationVo.getLoc_id());
		locationVo.setMem_id(memberVo.getMem_id());
		
		int insertLocationCnt = registerService.insertLocation(locationVo);
		
		dayVo.setCw_day(dayVo.getCw_day());
		dayVo.setMem_id(memberVo.getMem_id());
		
		int insertDayCnt = registerService.insertDay(dayVo);
		
		cwServiceTypeVo.setSer_type_id(cwServiceTypeVo.getSer_type_id());
		cwServiceTypeVo.setMem_id(memberVo.getMem_id());
		
		int insertCWServiceCnt = registerService.insertCWServiceType(cwServiceTypeVo);
		
		
		hospitalVo.setHos_nm(hospitalVo.getHos_nm());
		hospitalVo.setHos_id(hospitalVo.getHos_id());
		hospitalVo.setHos_phone(hospitalVo.getHos_phone());
		hospitalVo.setHos_add(hospitalVo.getHos_add());
		
		int insertHopitalCnt = registerService.insertHospital(hospitalVo);
		
		
		careerVo.setCareer_st_dt(careerVo.getCareer_st_dt());
		careerVo.setCareer_end_dt(careerVo.getCareer_end_dt());
		careerVo.setCareer_cont(careerVo.getCareer_cont());
		careerVo.setCw_career_id(careerVo.getCw_career_id());
		careerVo.setMem_id(careerVo.getMem_id());
		careerVo.setHos_id(careerVo.getHos_id());
		
		int insertCareerCnt = registerService.insertCareer(careerVo);
		
		if(insertCWMemberCnt == 1 && insertLocationCnt == 1 && insertDayCnt == 1 && insertCWServiceCnt == 1 
				&& insertHopitalCnt == 1 && insertCareerCnt == 1) {
			return "success";
		}
		else {
			return "false";
		}
		
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
