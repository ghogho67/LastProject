package kr.or.ddit.matching.attendance.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.joinVo.AttendanceMatchingVo;
import kr.or.ddit.matching.attendance.service.IAttendanceService;
import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.member.member.service.IMemberService;
import kr.or.ddit.page.model.PageVo;

@RequestMapping("/attendance")
@Controller
public class AttendanceController {
	private static final Logger logger = LoggerFactory.getLogger(AttendanceController.class);
	
	@Resource(name = "attendanceService")
	private IAttendanceService attendanceService; 
	@Resource(name = "memberService")
	private IMemberService memberService; 
	
	
	


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
	
	/**
	* Method : worker_MatchingTest
	* 작성자 : 이광호
	* 변경이력 :
	* @param mem_id
	* @param check
	* @return
	* Method 설명 : 요양보호사가 방문요양을 할시 출석체크 할수있는 메서드(담당회원정보에 QR코드로)
	*/
	@RequestMapping(path = "/matchingTest", method = RequestMethod.GET)
	public String worker_MatchingTest(HttpServletRequest request) {
		String mem_id = request.getParameter("memId");
		String cw_mem_id = request.getParameter("cwMemId");
		logger.debug("☞mem_id:{}",mem_id);
		logger.debug("☞cw_mem_id:{}",cw_mem_id);
		logger.debug("☞");
		
		
		
		return "";
		
	}
	
	@ResponseBody
	@RequestMapping(value = "matTest", produces = "application/json; charset = utf-8")
	public JSONObject MatchingTest(Model model, String mem_id, String cw_mem_id) {
		Map<String, String>check = new HashMap<String, String>();
		check.put("mem_id", mem_id);
		check.put("cw_mem_id", cw_mem_id);
		String mat_id = attendanceService.checkLogin(check);
		JSONObject obj = new JSONObject();
		
		logger.debug("☞mat_id:{}",mat_id);
		if(mat_id==null) {
			obj.put("message", "아이디가 틀렸거나 매칭된내역이없습니다.");
			obj.put("mat_id", mat_id);
		}else{
			obj.put("message", "매칭번호는 " + mat_id+ " 입니다.");
			obj.put("mat_id", mat_id);
		}
		
		
		logger.debug("☞mem_id:{}",mem_id);
		logger.debug("☞cw_mem_id:{}",cw_mem_id);
		logger.debug("☞obj:{}",obj.get("message"));
		
		return obj;
	}
	
	/**
	 * Method : loginProcess
	 * 작성자 : PC21
	 * 변경이력 :
	 * @return
	 * Method 설명 : 사용자 로그인 요청처리 POST
	 */
	
	@ResponseBody
	@RequestMapping(value = "cwlogin", produces = "application/json; charset = utf-8")
	public JSONObject cwLogin(String mem_id, String mem_pass) {
		logger.debug("☞로그인 ");
		String encyptPassword = mem_pass;/*KISA_SHA256.encrypt(mem_pass);*/
		MemberVo memVo = memberService.getMemVo(mem_id);

		JSONObject obj = new JSONObject();
		
		if (memVo != null && !memVo.getMem_del().equals("Y") 
						  && encyptPassword.equals(memVo.getMem_pass())){
			obj.put("mem_grade", memVo.getMem_grade());
			obj.put("message", "어서오세요");
		}
		else {
			obj.put("message", "아이디와 비밀번호가 틀렸습니다.");
			obj.put("mem_grade", "4");
			
		}
		return obj;
	}
	
	/**
	* Method : worker_OnWork
	* 작성자 : 이광호
	* 변경이력 :
	* @param mem_id
	* @param check
	 * @return 
	* @return
	* Method 설명 : 요양보호사가 방문요양 퇴근 할시 출석체크 할수있는 메서드(담당회원정보에 QR코드로)
	*/
	@RequestMapping(path = "/checkIn", method = RequestMethod.GET)
	public String worker_OnWork(Model model, String matid) {
		
		int mat_id = Integer.parseInt(matid);
		int bool = attendanceService.checkInCheck(mat_id);
		if(bool != 1) {
			int insert = attendanceService.checkIn(mat_id);
			return "check/checkIn";
		}else {
			return "check/checkInDouble";
		}
		
			
		
	}
	
	/**
	* Method : worker_OffWork
	* 작성자 : 이광호
	* 변경이력 :
	* @param mem_id
	* @param check
	* @return
	* Method 설명 : 요양보호사가 방문요양을 할시 출석체크 할수있는 메서드(담당회원정보에 QR코드로)
	*/
	@RequestMapping(path = "/checkOut", method = RequestMethod.GET)
	public String worker_OffWork(Model model, String matid) {
		logger.debug("☞퇴근 완료");
		logger.debug("☞matid:{}",matid);
		
		int mat_id = Integer.parseInt(matid);
		int ad_id = attendanceService.attendanceAdIdCnt(mat_id);
		logger.debug("☞ad_id:{}",ad_id);
		
		Map<String, Integer> checkOut = new HashMap<String, Integer>(); 
		checkOut.put("mat_id", mat_id);
		checkOut.put("ad_id", ad_id);
		int insert = attendanceService.checkOut(checkOut);
		
		
		return "check/checkOut";
		 
	}
	
	/**
	* Method : cwMypageAttendance
	* 작성자 : PC21
	* 변경이력 :
	* @param model
	* @param session
	* @return
	* Method 설명 : 2019-08-05 요양보호사 출결전체조회
	*/
	@RequestMapping(path = "/cwMatList", method = RequestMethod.GET)
	public String cwMypageAttendance(Model model, HttpSession session) {
		MemberVo memvo = (MemberVo) session.getAttribute("MEM_INFO");
		String cw_mem_id = memvo.getMem_id();
		
		PageVo pageVo = new PageVo();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cw_mem_id", cw_mem_id);
		map.put("page", pageVo.getPage());
		map.put("pageSize", pageVo.getPageSize());
		
		logger.debug("☞:cw_mem_id :{}",cw_mem_id);
		Map<String, Object> resultMap = attendanceService.cwMatchingList(map);
		List<AttendanceMatchingVo>attendanceList = (List<AttendanceMatchingVo>) resultMap.get("cwMatchingList");
		logger.debug("☞attendanceList:{}",attendanceList);
		model.addAttribute("cwMatList", attendanceList);
		model.addAttribute("pageVo",pageVo);
		model.addAttribute("paginationSize",resultMap.get("paginationSize"));
		
		return "/mypage/check/cw_check.mytiles";
	}
	
	/**
	* Method : saerchList
	* 작성자 : PC21
	* 변경이력 :
	* @param model
	* @param searchType
	* @param saerchVal
	* @param session
	* @return
	* Method 설명 : 요양보호사 검색 날짜, 회원별 검색
	*/
	@RequestMapping(path = "/saerch", method = RequestMethod.POST)
	public String saerchList(Model model, String searchType, String saerchVal,HttpSession session) {
		MemberVo memvo = (MemberVo) session.getAttribute("MEM_INFO");
		String cw_mem_id = memvo.getMem_id();
		PageVo pageVo = new PageVo();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cw_mem_id", cw_mem_id);
		map.put("page", pageVo.getPage());
		map.put("pageSize", pageVo.getPageSize());
		
		if(searchType.equals("memid")&&!saerchVal.equals("")) {
			String mem_id = saerchVal;
			map.put("mem_id", mem_id);
			Map<String, Object> resultMap = attendanceService.memidSaerchList(map);
			List<AttendanceMatchingVo>attendanceList = (List<AttendanceMatchingVo>) resultMap.get("memidSaerchList");
			logger.debug("☞:saerchVal :{}",saerchVal);
			logger.debug("☞:searchType :{}",searchType);
			logger.debug("☞:attendanceList:{}",attendanceList);
			
			model.addAttribute("cwMatList", attendanceList);
			model.addAttribute("pageVo",pageVo);
			model.addAttribute("paginationSize",resultMap.get("paginationSize"));
			return "/mypage/check/cw_check.mytiles";
		
		}else if(searchType.equals("day")&&!saerchVal.equals("")) {
			String day = saerchVal;
			map.put("day", day);
			Map<String, Object> resultMap = attendanceService.daySaerchList(map);
			List<AttendanceMatchingVo>attendanceList = (List<AttendanceMatchingVo>) resultMap.get("daySaerchList");
			logger.debug("☞:saerchVal :{}",saerchVal);
			logger.debug("☞:day :{}",day);
			logger.debug("☞:attendanceList :{}",attendanceList);
			
			model.addAttribute("cwMatList", attendanceList);
			model.addAttribute("pageVo",pageVo);
			model.addAttribute("paginationSize",resultMap.get("paginationSize"));
			return "/mypage/check/cw_check.mytiles";
			
		}else if(searchType.equals("memid") && saerchVal.equals("")){
			return "redirect:/attendance/cwMatList";
		}else if((searchType.equals("day")&&saerchVal.equals(""))){
			return "redirect:/attendance/cwMatList";
		}else {
			return "redirect:/attendance/cwMatList";
			
		}
	}
	
	
	@RequestMapping(path = "/adminCheckList", method = RequestMethod.GET)
	public String adminCheckList(Model model) {
		
		PageVo pageVo = new PageVo();
		Map<String, Object> map = new HashMap<String, Object>();
		
		Map<String, Object> resultMap = attendanceService.adminCheckList(pageVo);
		List<AttendanceMatchingVo>attendanceList = (List<AttendanceMatchingVo>) resultMap.get("adminCheckList");
		model.addAttribute("adminCheckList", attendanceList);
		model.addAttribute("pageVo",pageVo);
		model.addAttribute("paginationSize",resultMap.get("paginationSize"));
		
		return "/mypage/check/admin_check.mytiles";
	}
	
	/**
	* Method : saerchList
	* 작성자 : PC21
	* 변경이력 :
	* @param model
	* @param searchType
	* @param saerchVal
	* @param session
	* @return
	* Method 설명 : 요양보호사 검색 날짜, 회원별 검색
	*/
	@RequestMapping(path = "/adminSaerch", method = RequestMethod.POST)
	public String adminSaerch(Model model, String searchType, String saerchVal,HttpSession session) {
		PageVo pageVo = new PageVo();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", pageVo.getPage());
		map.put("pageSize", pageVo.getPageSize());
		
		if(searchType.equals("memid")&&!saerchVal.equals("")) {
			String mem_id = saerchVal;
			map.put("mem_id", mem_id);
			Map<String, Object> resultMap = attendanceService.adminMemShearch(map);
			List<AttendanceMatchingVo>attendanceList = (List<AttendanceMatchingVo>) resultMap.get("adminMemSaerch");
			
			model.addAttribute("adminCheckList", attendanceList);
			model.addAttribute("pageVo",pageVo);
			model.addAttribute("paginationSize",resultMap.get("paginationSize"));
			return "/mypage/check/admin_check.mytiles";
		
		}else if(searchType.equals("day")&&!saerchVal.equals("")) {
			String day = saerchVal;
			map.put("day", day);
			Map<String, Object> resultMap = attendanceService.adminDaySearch(map);
			List<AttendanceMatchingVo>attendanceList = (List<AttendanceMatchingVo>) resultMap.get("adminDaySaerch");
			
			
			model.addAttribute("adminCheckList", attendanceList);
			model.addAttribute("pageVo",pageVo);
			model.addAttribute("paginationSize",resultMap.get("paginationSize"));
			return "/mypage/check/admin_check.mytiles";
			
		}else if(searchType.equals("memid") && saerchVal.equals("")){
			return "redirect:/attendance/adminCheckList";
		}else if((searchType.equals("day")&&saerchVal.equals(""))){
			return "redirect:/attendance/adminCheckList";
		}else {
			return "redirect:/attendance/adminCheckList";
			
		}
	}
	
}
