package kr.or.ddit.login.controller;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.encrypt.kisa.sha256.KISA_SHA256;
import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.member.member.service.IMemberService;

@Controller
public class LoginController {
	@Resource(name = "memberService")
	private IMemberService memberService;

	/**
	 * Method : loginView
	 * 작성자 : PC21
	 * 변경이력 :
	 * @param session
	 * @return
	 * Method 설명 : 사용자 로그인 화면 요청 GET
	 */
	@RequestMapping(path = "/login", method = RequestMethod.GET)
	public String loginView(HttpSession session){
		if(session.getAttribute("MEM_INFO") != null)
			return "main"; // /WEB-INF/views/main.jsp
		else
		return "login";// /WEB-INF/login/login.jsp
		
		//이런형식이기 때문에 login 폴더는 WEB-INF 에 있어야한다.
		//prefix : /WEB-INF/views/
		//suffix: .jsp
	}
	
	
	
	/**
	 * Method : loginProcess
	 * 작성자 : PC21
	 * 변경이력 :
	 * @return
	 * Method 설명 : 사용자 로그인 요청처리 POST
	 */
	
	@RequestMapping(path = "/login", method = RequestMethod.POST)
	
	public String loginProcess(String mem_id, String mem_pass, String remember
								,HttpServletResponse response, HttpSession session) {
//		String encyptPassword = KISA_SHA256.encrypt(mem_pass);
		MemberVo memVo = memberService.getMemVo(mem_id);
		
		if (memVo != null /* && encyptPassword.equals(memVo.getMem_pass()) */ ){
			rememberMeCookie(mem_id, remember, response);
			session.setAttribute("MEM_INFO", memVo);
		
			return "main";
		}
		else
			return "login";
	}
	


	/**
	 * Method : rememberMeCookie
	 * 작성자 : PC21
	 * 변경이력 :
	 * @param mem_id
	 * @param remember
	 * @param response
	 * Method 설명 : rememberme 쿠키를 응답으로 생성
	 */
	private void rememberMeCookie(String mem_id, String remember, HttpServletResponse response) {
		int cookieMaxAge = 0;
		if(remember != null)
			cookieMaxAge = 60*60*24*30;
		
		Cookie mem_idCookie = new Cookie("mem_id",mem_id);
		mem_idCookie.setMaxAge(cookieMaxAge);
		
		Cookie rememberCookie = new Cookie("remember", "true");
		rememberCookie.setMaxAge(cookieMaxAge);
		
		response.addCookie(mem_idCookie);
		response.addCookie(rememberCookie);
	}
}
