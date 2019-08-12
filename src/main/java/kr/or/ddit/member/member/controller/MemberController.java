package kr.or.ddit.member.member.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.member.member.service.IMemberService;
@RequestMapping("/member")
@Controller
public class MemberController {
	
	@Resource(name = "memberService")
	private IMemberService memberService;
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	

	

//	/**
//	 * Method : goldmemberJoin
//	 * 작성자 : 오도아 
//	 * 변경이력 :
//	 * @return
//	 * Method 설명 :
//	 */
//	@RequestMapping(path = "/gradeChangeToGold" )
//	public String goldmemberJoin(HttpSession session) {
//		
//		MemberVo memberVo = (MemberVo) session.getAttribute("MEM_INFO");
//		String mem_id=memberVo.getMem_id();
//		
//		
//		//회원테이블의 등급을 골드로 변경
//		int upgradeMemberStep1= memberService.upgradeMemberStep1(mem_id);
//		
//		if(upgradeMemberStep1==1) {
//			int upgradeMemberStep2 = memberService.upgradeMemberStep2(mem_id);
//		}
//		
//	    //세션을 재설정
//		session.setAttribute("MEM_INFO", memberVo);
//		
//		return "main";
//	}
	

	//골드 회원 이었다가 일반 회원이 된경우 골드 회원 가입 권유 모달창을 한번더 띄운다 
	
	
	
	

}
