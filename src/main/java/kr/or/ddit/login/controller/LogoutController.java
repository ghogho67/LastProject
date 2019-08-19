package kr.or.ddit.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class LogoutController {
	private static final Logger logger = LoggerFactory.getLogger(LogoutController.class);
	
	
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
