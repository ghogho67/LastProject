package kr.or.ddit.login.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.category.category.model.CategoryVo;
import kr.or.ddit.category.category.service.ICategoryService;
import kr.or.ddit.gold.gold.model.GoldVo;
import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.member.member.service.IMemberService;

@Controller
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Resource(name = "memberService")
	private IMemberService memberService;
	
	@Resource(name = "categoryService")
	private ICategoryService categoryService;

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
								,HttpServletResponse response, HttpSession session, Model model) {
		String fail = "탈퇴회원이시거나 아이디,비밀번호가 틀렸습니다."; 
		String encyptPassword = mem_pass;/*KISA_SHA256.encrypt(mem_pass);*/
		MemberVo memVo = memberService.getMemVo(mem_id);
		
		if (memVo != null && !memVo.getMem_del().equals("Y") && encyptPassword.equals(memVo.getMem_pass()) ){
			rememberMeCookie(mem_id, remember, response);
			session.setAttribute("MEM_INFO", memVo);
			model.addAttribute("mem_id",mem_id);
		
		
			// 
			/**
			 * Method : 
			 * 작성자 : 오도아
			 * 변경이력 :
			 * @return
			 * Method 설명 :   로그인시 골드회원 날짜 여부 체크해서 자동적으로 서비스 동료되게 하고 모달창 띄움
			 */
			
			
			//오늘날짜로 골드회원이용권이 종료되는  회원아이디목록을 가져온다
			List<String> downGradeMemberStep1=memberService.downGradeMemberStep1();	
			logger.debug("@@@@downGradeMemberStep1{}",downGradeMemberStep1);
			
			
			//해당 아이디 리스트안에 로근인한 회원의 아이디가 있는지 조회한다
			if(downGradeMemberStep1.contains(mem_id)==true){
				logger.debug("@@@@ture{}","ture");
				logger.debug("@@@@mem_id{}",mem_id);
				
				
				
				//만약있다면  해당회원의 등급을 조정하고
				int downGradeMemberStep2 =memberService.downGradeMemberStep2(mem_id);
				logger.debug("@@@@downGradeMemberStep2{}",downGradeMemberStep2);
				
				
				//조정이 완료 되었다면 골드서비스 사용이력을 조정한다
				if(downGradeMemberStep2==1) {
					int downGradeMemberStep3=memberService.downGradeMemberStep3(mem_id);
					logger.debug("@@@@downGradeMemberStep3{}",downGradeMemberStep3);
					
				}
			}
				
				//해당회원의  골드테이블정보를 가져온다 
			GoldVo goldvo = memberService.downGradeMember(mem_id);
			logger.debug("@@@@goldvo{}",goldvo);
			model.addAttribute("goldvo",goldvo);
		
				
			MemberVo memberVo = memberService.getMemVo(memVo.getMem_id());
			logger.debug("@@@@memVo{}",memberVo);
			session.setAttribute("MEM_INFO", memberVo);
			session.setAttribute("mem_id", mem_id);
			
			List<CategoryVo> categoryList = categoryService.getCategoryList();
			session.setAttribute("categoryList", categoryList);
//			List<CategoryVo> categoryList2 = categoryService.getCategoryList2();
//			int maxLevel=categoryService.maxLevel();
//			session.setAttribute("categoryList", categoryList2);
//			session.setAttribute("maxLevel", maxLevel);
//			logger.debug("cate : {}",categoryList2);

			return "redirect:crawling";
		}
		else {
		
			model.addAttribute("fail",fail);
			return "login";
		}
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
	
	
	
	
	@RequestMapping("/main")
	public String main() {
		return "main";
	}

	
	
	
	
	
	
	
	
	
	/**
	 * Method : goldmemberJoin
	 * 작성자 : 오도아 
	 * 변경이력 :
	 * @return
	 * Method 설명 :
	 */
	@RequestMapping(path = "/gradeChangeToGold" )
	public String goldmemberJoin(HttpSession session) {
		
		MemberVo memberVo = (MemberVo) session.getAttribute("MEM_INFO");
		String mem_id=memberVo.getMem_id();
		logger.debug("@@@@mem_id{}",mem_id);
		
		//골드테이블에 있는지 확인한다 
		GoldVo goldvo = memberService.downGradeMember(mem_id);
		
		if(goldvo==null){
			//골드테이블에 없다면
			//회원테이블의 등급을 골드로 변경
			int upgradeMemberStep1= memberService.upgradeMemberStep1(mem_id);
			logger.debug("@@@@upgradeMemberStep1{}",upgradeMemberStep1);
			
			if(upgradeMemberStep1==1) {
				int upgradeMemberStep2 = memberService.upgradeMemberStep2(mem_id);
				logger.debug("@@@@upgradeMemberStep2{}",upgradeMemberStep2);
			}
			
		}else {
			//골드테이블에 있다면
			int upgradeMemberStep1= memberService.upgradeMemberStep1(mem_id);
			logger.debug("@@@@upgradeMemberStep1{}",upgradeMemberStep1);
			
			int upgradeMemberStep3 = memberService.upgradeMemberStep3(mem_id);
			logger.debug("@@@@upgradeMemberStep3{}",upgradeMemberStep3);
			
		}
		
		MemberVo memVo = memberService.getMemVo(memberVo.getMem_id());
		logger.debug("@@@@memVo{}",memVo);
		
	    //세션을 재설정
		session.setAttribute("MEM_INFO", memVo);
		logger.debug("@@@@MEM_INFO{}",memVo);
		return "main";
	}
	
	
	
	
	
	
	
	
	
	
}
