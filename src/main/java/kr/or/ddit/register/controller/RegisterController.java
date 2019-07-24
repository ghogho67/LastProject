package kr.or.ddit.register.controller;

import java.util.HashMap;
import java.util.Map;

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

import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.member.memberDisease.model.MemberDiseaseVo;
import kr.or.ddit.register.service.IRegisterService;
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
	* Method : idCheck
	* 작성자 : ADMIN
	* 변경이력 :
	* @return
	* Method 설명 :아이디 중복체크 요청
	*/
//	@RequestMapping(path = "/idCheck", method = RequestMethod.GET)
//	public String idCheck() {
//		
//		return "/regist/registrationStep3_Form";
//	}
	
	/**
	* Method : idCheck
	* 작성자 : ADMIN
	* 변경이력 :
	* @param mem_id
	* @param model
	* @return
	* Method 설명 : 아이디 중복체크 처리, 정규식 처리
	*/
	@RequestMapping(path = "/idCheck")
	public String idCheck(String mem_id, Model model) {
		
		logger.debug("!!!!!mem_id : {}",mem_id);
		String str = "";
		int idCheck = registerService.idCheck(mem_id);
		boolean idRegCheck = regCheck.regId(mem_id);
		logger.debug("!!!!!idCheck : {}",idCheck);
		
//		if(idRegCheck = true) {
//			
//		}
		
		if(idCheck == 1) {
			str = "no";		//존재
		}else{
			str = "yes";	//사용가능
		}
//		if(idRegCheck == false) {
//			str = "false"; 	//정규식 다시
//		}
//		else {
//		}
		logger.debug("!!!!!str : {}",str);
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
	public String insertRegist1(Model model, MemberVo memberVo, String frmData, BindingResult result, MemberDiseaseVo memberDiseaseVo,
			MultipartFile profile, RedirectAttributes redirectAttributes) {

		memberVo = new MemberVo();
		memberDiseaseVo = new MemberDiseaseVo();
		String str ="";
		
		boolean idCheck = regCheck.regId(memberVo.getMem_id());
		if(idCheck==false) {
			str = "아이디를 정규식에 맞게 입력해 주세요";
			model.addAttribute("data", str);
			return "jsonView";
		}
		boolean passCheck = regCheck.regPass(memberVo.getMem_pass());
		if(passCheck==false) {
			str = "패스워드를 정규식에 맞게 입력해 주세요";
			model.addAttribute("msg", str);
			return "jsonView";
		}
		boolean nameCheck = regCheck.regName(memberVo.getMem_nm());
		if(nameCheck==false) {
			str = "이름을 정규식에 맞게 입력해 주세요";
			model.addAttribute("msg", str);
			return "jsonView";
		}
		boolean phoneCheck = regCheck.regPhone(memberVo.getMem_phone());
		if(phoneCheck==false) {
			str = "이름을 정규식에 맞게 입력해 주세요";
			model.addAttribute("msg", str);
			return "jsonView";
		}
		boolean mailCheck = regCheck.regMail(memberVo.getMem_mail());
		if(mailCheck==false) {
			str = "이메일을 정규식에 맞게 입력해 주세요";
			model.addAttribute("msg", str);
			return "jsonView";
		}
		
		int insertMemberCnt = registerService.insertMember(memberVo);
		int insertMemberdieseaseCnt = registerService.insertMemberDisease(memberDiseaseVo);

		model.addAttribute("memList", memberVo);
		model.addAttribute("memDisList", memberDiseaseVo);
		
		if(insertMemberCnt ==1 && insertMemberdieseaseCnt == 1 ) {
			return "/regist/registrationStep4_Complete";
		}
		
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
