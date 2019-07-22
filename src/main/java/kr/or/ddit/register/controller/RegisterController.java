package kr.or.ddit.register.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/regist")
@Controller
public class RegisterController {
	
	
	@RequestMapping(path = "/regist1", method = RequestMethod.GET)
	public String regist() {
		
		return "/regist/registrationStep1_TypeSelect";
	}
	
	
	
	@RequestMapping(path = "/regist2", method = RequestMethod.POST)
	public String registNotice() {
		
		return "/regist/registrationStep1_TypeSelect";
	}
	
	@RequestMapping(path = "/regist3", method = RequestMethod.GET)
	public String registMember() {
		
		return "/regist/registrationStep3_Form";
	}
	
	@RequestMapping(path = "/regist3_1", method = RequestMethod.POST)
	public String registMember1() {
		
		return "/regist/registrationStep3_Form";
	}
	
	
	@RequestMapping(path = "/regist4", method = RequestMethod.GET)
	public String registCwMember() {
		
		return "/regist/registrationStep4_Form";
	}
	
	
	@RequestMapping(path = "/regist4_1", method = RequestMethod.POST)
	public String registCwMember1() {
		
		return "/regist/registrationStep4_Form";
	}
	
	@RequestMapping(path = "/regist5", method = RequestMethod.POST)
	public String registComplete() {
		
		return "/regist/registrationStep5_Complete";
	}
	
	
	
	
	

}
