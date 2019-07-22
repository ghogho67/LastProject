package kr.or.ddit.member.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@RequestMapping("/member")
@Controller
public class MemberController {
	
	
	

	@RequestMapping("/nmypage_MyInfo")
	public String nmypage_MyInfo() {
		return "mypage/nmypage_MyInfo";
	}
	
	
	
	
	@RequestMapping("/nmypage_MyInfoModification")
	public String nmypage_MyInfoModification() {
		return "mypage/nmypage_MyInfoModification";
	}
	
	

}
