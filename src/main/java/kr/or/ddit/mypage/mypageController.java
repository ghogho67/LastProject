package kr.or.ddit.mypage;





import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.matching.grade.service.IGradeService;
import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.member.member.service.IMemberService;
import kr.or.ddit.util.PartUtil;

@RequestMapping("/mypage")
@Controller
public class mypageController {
	private static final Logger logger = LoggerFactory.getLogger(mypageController.class);
	
	@Resource(name = "memberService")
	private IMemberService memberService;
	
	@Resource(name = "gradeService")
	private IGradeService gradeService;

	@RequestMapping("/Patient_Info")
	public String Patient_Info() {
		return "mypage/Patient_Info";
	}

	@RequestMapping(path = "/Patient_InfoModification", method = RequestMethod.GET)
	public String Patient_InfoModification() {
		return "mypage/Patient_InfoModification";
	}

	@RequestMapping(path = "/Patient_InfoModification", method = RequestMethod.POST)
	public String Patient_InfoModification(Model model, MultipartFile profile, HttpSession session,
			RedirectAttributes redirectAttributes, HttpServletRequest request,
			@RequestParam(name = "memid") String mem_id, @RequestParam(name = "grade") String grade,
			@RequestParam(name = "pass") String mem_pass, @RequestParam(name = "email") String mem_mail,
			@RequestParam(name = "phone") String mem_phone, @RequestParam(name = "zipcd") String mem_zipcd,
			@RequestParam(name = "addr1") String mem_add1, @RequestParam(name = "addr2") String mem_add2,
			@RequestParam(name = "pro_relation") String pro_relation, @RequestParam(name = "pro_nm") String pro_nm,
			@RequestParam(name = "pro_phone") String pro_phone)
			throws IllegalStateException, IOException {

		String viewName;

		String mem_nm = "";
		String mem_birth = "";
		String mem_gender = "";
		String mem_del = "";
		String mem_grade = "";
		String cw_driver = "";
		String cw_lic = "";
		String mem_photo_path = "";
		String mem_photo_nm = "";


		logger.debug("@@@@grade : {} ", grade);
		logger.debug("@@@@mem_pass : {} ", mem_pass);
		logger.debug("@@@@mem_mail : {} ", mem_mail);
		logger.debug("@@@@mem_phone : {} ", mem_phone);
		logger.debug("mem_zipcd : {} ", mem_zipcd);
		logger.debug("mem_add1 : {} ", mem_add1);
		logger.debug("mem_add2 : {} ", mem_add2);
		logger.debug("@@@@pro_relation : {} ",pro_relation);
		logger.debug("@@@@pro_nm : {} ", pro_nm);
		logger.debug("@@@@pro_phone : {} ", pro_phone);

		MemberVo memberVo = null;

		if (profile.getSize() > 0) {
			String fileName = profile.getOriginalFilename();
			String ext = PartUtil.getExt(fileName);

			String uploadPath = PartUtil.getUploadPath();

			String filePath = uploadPath + File.separator + UUID.randomUUID().toString() + ext;

			mem_photo_path = filePath;
			mem_photo_nm = fileName;

			profile.transferTo(new File(filePath));

		}

		if (grade.equals("3")==false) {

			memberVo = new MemberVo(mem_id, mem_nm, mem_birth, mem_gender, mem_pass, mem_phone, mem_add1, mem_add2,
					mem_zipcd, mem_mail, mem_grade, mem_del, mem_photo_path, mem_photo_nm, pro_relation, pro_nm,
					pro_phone, cw_driver, cw_lic);

			int updateCnt = memberService.updatePMember(memberVo);

			logger.debug("@@@@updateCnt : {} ", updateCnt);
			
			if (updateCnt != 1) {
				viewName = "redirect:/login";
			}
			session.setAttribute("MEM_INFO", memberVo);
			
			viewName = "redirect:/mypage/Patient_Info";
			
		} else {
			viewName = "redirect:/main";
		}

		
		logger.debug("@@@@viewName : {} ", viewName);
		return viewName;
	}
	
	
	
	

	/**
	* Method : Worker_Info
	* 작성자 : 이광호
	* 변경이력 : 2019.07.25
	* @param session
	* @param model
	* @return
	* Method 설명 : 요양보호사 회원정보 화면에서 평가점수 출력 추가
	*/
	@RequestMapping("/Worker_Info")
	public String Worker_Info(HttpSession session, Model model) {
		MemberVo memvo = (MemberVo) session.getAttribute("MEM_INFO");
		String mem_id = memvo.getMem_id();
		String grade = gradeService.cwGradeAvg(mem_id);
		if(grade == null) {
			grade = "0";
			model.addAttribute("grade", grade);
		}else{
			model.addAttribute("grade", grade);
		}
		
		return "mypage/Worker_Info";
	}

	@RequestMapping(path = "/Worker_InfoModification", method = RequestMethod.GET)
	public String Worker_InfoModification() {
		return "mypage/Worker_InfoModification";
	}

	@RequestMapping(path = "/Worker_InfoModification", method = RequestMethod.POST)
	public String Worker_InfoModification(Model model, MultipartFile profile, HttpSession session,
			RedirectAttributes redirectAttributes, HttpServletRequest request,
			@RequestParam(name = "memid") String mem_id, @RequestParam(name = "grade") String grade,
			@RequestParam(name = "pass") String mem_pass, @RequestParam(name = "email") String mem_mail,
			@RequestParam(name = "phone") String mem_phone, @RequestParam(name = "zipcd") String mem_zipcd,
			@RequestParam(name = "addr1") String mem_add1, @RequestParam(name = "addr2") String mem_add2)
			throws IllegalStateException, IOException {

		String viewName;

		String mem_nm = "";
		String mem_birth = "";
		String mem_gender = "";
		String mem_del = "";
		String mem_grade = "";
		String cw_driver = "";
		String cw_lic = "";
		String mem_photo_path = "";
		String mem_photo_nm = "";
		String pro_relation = "";
		String pro_nm = "";
		String pro_phone = "";

		logger.debug("@@@@grade : {} ", grade);
		logger.debug("@@@@mem_pass : {} ", mem_pass);
		logger.debug("@@@@mem_mail : {} ", mem_mail);
		logger.debug("@@@@mem_phone : {} ", mem_phone);
		logger.debug("mem_zipcd : {} ", mem_zipcd);
		logger.debug("mem_add1 : {} ", mem_add1);
		logger.debug("mem_add2 : {} ", mem_add2);

		MemberVo memberVo = null;

		if (profile.getSize() > 0) {
			String fileName = profile.getOriginalFilename();
			String ext = PartUtil.getExt(fileName);

			String uploadPath = PartUtil.getUploadPath();

			String filePath = uploadPath + File.separator + UUID.randomUUID().toString() + ext;

			mem_photo_path = filePath;
			mem_photo_nm = fileName;

			profile.transferTo(new File(filePath));

		}

		if (grade.equals("3")) {

			memberVo = new MemberVo(mem_id, mem_nm, mem_birth, mem_gender, mem_pass, mem_phone, mem_add1, mem_add2,
					mem_zipcd, mem_mail, mem_grade, mem_del, mem_photo_path, mem_photo_nm, pro_relation, pro_nm,
					pro_phone, cw_driver, cw_lic);

			int updateCnt = memberService.updateMember(memberVo);

			if (updateCnt != 1) {
				viewName = "redirect:/login";
			}
			session.setAttribute("MEM_INFO", memberVo);
			viewName = "redirect:/mypage/Worker_Info";
		} else {

			viewName = "redirect:/login";
		}

		return viewName;
	}

	
	
	@RequestMapping("/Admin_Info")
	public String Admin_Info() {
		return "mypage/Admin_Info";
	}

	
	
	
	
	@RequestMapping(path ="/Patient_Wd", method = RequestMethod.GET)
	public String Patient_Wdl() {
		return "mypage/Patient_Wd";
	}
	
	
	
	@RequestMapping(path ="/Patient_Wd", method = RequestMethod.POST)
	public String Patient_withdrawal(Model model, HttpSession session,
			RedirectAttributes redirectAttributes, HttpServletRequest request,
			@RequestParam(name = "memid") String mem_id,@RequestParam(name = "mempass") String mem_pass,
			@RequestParam(name = "id") String input_id,@RequestParam(name = "pass") String input_pass) {
		
		
		
		
		logger.debug("@@@@mem_id : {} ", mem_id);
		logger.debug("@@@@input_id : {} ", input_id);
		logger.debug("@@@@mem_pass : {} ", mem_pass);
		logger.debug("@@@@input_pass : {} ", input_pass);
		
		
		
		
		
		 String viewName;
		
		String mem_nm = "";
		String mem_birth = "";
		String mem_gender = "";
		String mem_del = "";
		String mem_grade = "";
		String cw_driver = "";
		String cw_lic = "";
		String mem_photo_path = "";
		String mem_photo_nm = "";
		String pro_relation = "";
		String pro_nm = "";
		String pro_phone = "";
		String mem_zipcd = "";
		String mem_mail = "";
		String mem_phone = "";
		String mem_add1 = "";
		String mem_add2 = "";
		
		MemberVo memberVo = null;
		
		
		if (mem_id.equals(input_id)&&mem_pass.equals(input_pass)){
			
			logger.debug("탈퇴");
			
			mem_del ="Y";			
			memberVo = new MemberVo(mem_id, mem_nm, mem_birth, mem_gender, mem_pass, mem_phone, mem_add1, mem_add2,
					mem_zipcd, mem_mail, mem_grade, mem_del, mem_photo_path, mem_photo_nm, pro_relation, pro_nm,
					pro_phone, cw_driver, cw_lic);

			int updateCnt = memberService.withdrwalMember(memberVo);
			logger.debug("@@@@updateCnt",updateCnt);
			
			if(updateCnt==1) {
				session.setAttribute("MEM_INFO", memberVo);
				viewName = "redirect:/login";
				
			}else {
				viewName = "redirect:/main";
			}
			
		}
		else
			viewName = "redirect:/main";
		
		
		return viewName;
	}
	

	@RequestMapping(path ="/Worker_Wd", method = RequestMethod.GET)
	public String Worker_Wd() {
		return "mypage/Worker_Wd";
	}
	
	@RequestMapping(path ="/Worker_Wd" , method = RequestMethod.POST)
	public String Worker_withdrawal(Model model,  HttpSession session,
			RedirectAttributes redirectAttributes, HttpServletRequest request,
			@RequestParam(name = "memid") String mem_id,@RequestParam(name = "mempass") String mem_pass,
			@RequestParam(name = "id") String input_id,@RequestParam(name = "pass") String input_pass) {
		
		
		
		
		logger.debug("@@@@mem_id : {} ", mem_id);
		logger.debug("@@@@input_id : {} ", input_id);
		logger.debug("@@@@mem_pass : {} ", mem_pass);
		logger.debug("@@@@input_pass : {} ", input_pass);
		
		
		
		
		
		String viewName;
		
		String mem_nm = "";
		String mem_birth = "";
		String mem_gender = "";
		String mem_del = "";
		String mem_grade = "";
		String cw_driver = "";
		String cw_lic = "";
		String mem_photo_path = "";
		String mem_photo_nm = "";
		String pro_relation = "";
		String pro_nm = "";
		String pro_phone = "";
		String mem_zipcd = "";
		String mem_mail = "";
		String mem_phone = "";
		String mem_add1 = "";
		String mem_add2 = "";
		
		MemberVo memberVo = null;
		
		
		if (mem_id.equals(input_id)&&mem_pass.equals(input_pass)){
			
			logger.debug("탈퇴");
			
			mem_del ="Y";			
			memberVo = new MemberVo(mem_id, mem_nm, mem_birth, mem_gender, mem_pass, mem_phone, mem_add1, mem_add2,
					mem_zipcd, mem_mail, mem_grade, mem_del, mem_photo_path, mem_photo_nm, pro_relation, pro_nm,
					pro_phone, cw_driver, cw_lic);

			int updateCnt = memberService.withdrwalMember(memberVo);
			logger.debug("@@@@updateCnt", updateCnt);
			
			if(updateCnt==1) {
				session.setAttribute("MEM_INFO", memberVo);
				viewName = "redirect:/login";
				
			}else {
				viewName = "redirect:/main";
			}
			
		}
		else
			viewName = "redirect:/main";
		
		
		return viewName;
	}
}
