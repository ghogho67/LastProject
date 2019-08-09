package kr.or.ddit.member.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@RequestMapping("/member")
@Controller
public class MemberController {
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	
	@RequestMapping("/goldmemberJoin")
	public String goldmemberJoin() {

		return "mypage/gradeChange";
	}
	
	
	
	
	//로그인컨트롤러 부분에  로그인시 골드회원 날짜 여부 체크해서 자동적으로 서비스 동료되게 하고 모달창 띄움
	@RequestMapping("/typicalmemberJoin")
	public String typicalmemberJoin() {
		
		return "recognitionActivites/improvementProgram/impStart";
	}

	
	

}
