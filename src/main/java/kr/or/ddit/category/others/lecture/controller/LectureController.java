package kr.or.ddit.category.others.lecture.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.category.others.culture.model.CultureVo;
import kr.or.ddit.category.others.culture.service.ICultureService;
import kr.or.ddit.category.others.lecture.model.LectureVo;
import kr.or.ddit.category.others.lecture.service.ILectureService;
import kr.or.ddit.member.member.model.MemberVo;

@RequestMapping("/lecture")
@Controller
public class LectureController {
	private static final Logger logger = LoggerFactory.getLogger(LectureController.class);
	
	
	@Resource(name = "lectureService")
	private ILectureService lectureService;

	@Resource(name = "cultureService")
	private ICultureService cultureService;
	
	
	
	@RequestMapping(path = "/lectureMain", method = RequestMethod.GET)
	public String categoryList(Model model, HttpSession session) {
		return "lecture/lectureMain";
	}
	
	
	
	
	
	@RequestMapping(path = "/lectureList", method = RequestMethod.GET)
	public String cultureList(Model model, HttpSession session, String lec_type) {
		logger.debug("@@@@lec_type {}",lec_type);
		
		
		List<LectureVo> CertainLectureList = lectureService.getCertainLectureList(lec_type);
		
		logger.debug("@@@@CategoryList : {} ", CertainLectureList);

		model.addAttribute("LTList", CertainLectureList);
		
		
		return "lecture/lectureList";
	
	
	}
	
	
	
	
	@RequestMapping(path = "/lectureListALL", method = RequestMethod.GET)
	public String lectureListALL(Model model,HttpSession session) {
		

		List<LectureVo> LectureList = lectureService.getLectureList();
		MemberVo memvo = (MemberVo) session.getAttribute("MEM_INFO");
		String memgrade=memvo.getMem_grade();
		
		logger.debug("@@@@LectureList : {} ", LectureList);
		logger.debug("@@@@memgrade : {} ", memgrade);

		model.addAttribute("LList", LectureList);
		model.addAttribute("memgrade", memgrade);
		
		return "lecture/lectureListAll";
	
	
	}
	
	
	
	//강의 상세보기 페이지 
	@RequestMapping(path = "/lecture", method = RequestMethod.GET)
	public String lecture(Model model,
			@RequestParam(name = "lectureId")int lec_id) {
		
		
		LectureVo lectureVo = lectureService.getLecture(lec_id);
		logger.debug("@@@@lectureVo{}",lectureVo);
		model.addAttribute("lecture",lectureVo);
		
		
		int culture_id= lectureVo.getCulture_id();
		CultureVo cultureVo = lectureService.getCulture(culture_id);
		
		logger.debug("@@@@cultureVo{}",cultureVo);
		model.addAttribute("culture",cultureVo);
		
		
		return "lecture/lecture";
	
	}
	
	

//강좌 관리	
	@RequestMapping(path = "/lectureListManagement", method = RequestMethod.GET)
	public String lectureListManagement(Model model) {
		

		List<LectureVo> LectureList = lectureService.getLectureList();
		
		logger.debug("@@@@LectureList : {} ", LectureList);

		model.addAttribute("LList", LectureList);
		return "lecture/lectureListManagement";
	
	
	}
	
	
	
	
	//강의 삭제
	
	@RequestMapping(path = "/lectureDelete", method = RequestMethod.GET)
	public String lectureDelete(Model model,
			@RequestParam(name = "lec_id")int lec_id) {
	
		
		logger.debug("@@@@lec_id{}",lec_id);
		
		String viewName =null;
		 int updateCnt = lectureService.deleteLecture(lec_id);
		
		 if(updateCnt>=1) {
			 viewName="redirect:/lecture/lectureListManagement";
		 }else {
			 viewName="redirect:/login";
		 }
		 
			return viewName;
	
	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	//강의 사용
	
	@RequestMapping(path = "/lectureUse", method = RequestMethod.GET)
	public String lectureUse(Model model,
			@RequestParam(name = "lec_id")int lec_id) {

		logger.debug("@@@@lec_id{}",lec_id);
		
		String viewName =null;
		 int updateCnt = lectureService.useLecture(lec_id);
		
		 if(updateCnt>=1) {
			 viewName="redirect:/lecture/lectureListManagement";
		 }else {
			 viewName="redirect:/login";
		 }
		 
			return viewName;
	
	
		
	}
	
	
	//강의 수정
	
	
	
	

	@RequestMapping(path = "/modifyLecture", method = RequestMethod.GET)
	public String modifyLecture(Model model,@RequestParam(name = "lec_id")int lec_id) {

		
		LectureVo lectureVo = lectureService.getLecture(lec_id);
		logger.debug("@@@@lectureVo{}",lectureVo);
		model.addAttribute("lecture",lectureVo);
		
		
		int culture_id= lectureVo.getCulture_id();
		CultureVo cultureVo = lectureService.getCulture(culture_id);
		
		logger.debug("@@@@cultureVo{}",cultureVo);
		model.addAttribute("culture",cultureVo);
		
		
		return "lecture/lectureModify";
	
	}
	
	
	@RequestMapping(path = "/modifyLecture", method = RequestMethod.POST)
	public String lectureupdate(Model model,
			@RequestParam(name = "lec_id")int lec_id,
			@RequestParam(name = "culture_id")int culture_id,
			@RequestParam(name = "lec_nm")String lec_nm,
			@RequestParam(name = "lec_tea")String lec_tea,
			@RequestParam(name = "lec_st_dt")Date lec_st_dt,
			@RequestParam(name = "lec_end_dt")Date lec_end_dt,
			@RequestParam(name = "lec_time")String lec_time,
			@RequestParam(name = "lec_fee")int lec_fee,
			@RequestParam(name = "lec_day")String lec_day,
			@RequestParam(name = "lec_type")String lec_type,
			@RequestParam(name = "lec_cont")String lec_cont,
			@RequestParam(name = "lec_amount")String lec_amount) {
		
		logger.debug("@@@@modifyLecture {}" ,"modifyLecture");
		logger.debug("@@@@lec_id {}" ,lec_id);
		
		String lec_use ="Y";
		
		LectureVo lectureVo= new LectureVo(lec_id, culture_id, lec_nm, lec_tea, lec_st_dt, lec_end_dt, lec_time, lec_fee, lec_day, lec_type, lec_amount, lec_use, lec_cont);

		String viewName =null;
		
		int updatelecture = lectureService.updateLecture(lectureVo);
		
		if(updatelecture==1) {
			 viewName="redirect:/lecture/lectureListManagement";
		}else {
			viewName="redirect:/login";
		}
		
		return viewName;
	}
	

	
	
	
	@RequestMapping(path = "/Insertlecture", method = RequestMethod.GET)
	public String Insertlecture(Model model) {

		return "lecture/lectureInsert";
	
	}
	
	
	
	
//강의 추가 
	@RequestMapping(path = "/Insertlecture", method = RequestMethod.POST)
	public String categoryInsert(Model model, HttpSession session,RedirectAttributes redirectAttributes,
			@RequestParam(name = "culture_id")int culture_id,
			@RequestParam(name = "lec_nm")String lec_nm,
			@RequestParam(name = "lec_tea")String lec_tea,
			@RequestParam(name = "lec_st_dt")Date lec_st_dt,
			@RequestParam(name = "lec_end_dt")Date lec_end_dt,
			@RequestParam(name = "lec_time")String lec_time,
			@RequestParam(name = "lec_fee")int lec_fee,
			@RequestParam(name = "lec_day")String lec_day,
			@RequestParam(name = "lec_type")String lec_type,
			@RequestParam(name = "lec_cont")String lec_cont,
			@RequestParam(name = "lec_amount")String lec_amount
		) {

	     int lec_id =0;
		 String lec_use="Y";
		 
		 LectureVo lectureVo= new LectureVo(lec_id, culture_id, lec_nm, lec_tea, lec_st_dt, lec_end_dt, lec_time, lec_fee, lec_day, lec_type, lec_amount, lec_use, lec_cont);

		
		String viewName =null;
		
		int insertlecture = lectureService.InsertLecture(lectureVo);
		
		
		if(insertlecture==1) {
			 viewName="redirect:/lecture/lectureListManagement";
		}else {
			viewName="redirect:/login";
		}
		
		return viewName;
		
	}
	

	
	@RequestMapping(path = "/InsertCulture", method = RequestMethod.POST)
	public String InsertCulture(Model model, HttpSession session,RedirectAttributes redirectAttributes,
			@RequestParam(name = "cultureadd")String culture_add,
			@RequestParam(name = "culture_type")String culture_type,
			@RequestParam(name = "culture_phone")String culture_phone
		) {
		 
         int cate_id =30020;
		 int culture_id=0;
		 
		 CultureVo cultureVo= new CultureVo( culture_id,  culture_add,  culture_type,  culture_phone,  cate_id);

		
		String viewName =null;
		
		int insertleCulture = cultureService.InsertCulture(cultureVo);
		
		
		if(insertleCulture==1) {
			 viewName="redirect:/lecture/lectureListManagement";
		}else {
			viewName="redirect:/login";
		}
		
		return viewName;
		
	}
	
	
	
	
}
