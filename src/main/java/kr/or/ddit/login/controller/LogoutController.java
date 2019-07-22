package kr.or.ddit.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class LogoutController {
	
	
	   /**
	   * Method : logoutView
	   * 작성자 : ADMIN
	   * 변경이력 :
	   * @param session
	   * @return
	   * Method 설명 :로그아웃 요청
	   */
	   @RequestMapping(path = "/logout", method = RequestMethod.GET)
	   public String logoutView(HttpSession session) {
	      
	      session.invalidate();
	      
	      return "login";
	   }
	
	

}
