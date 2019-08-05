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

import kr.or.ddit.category.category.model.CategoryVo;
import kr.or.ddit.category.others.lecture.model.LectureVo;
import kr.or.ddit.category.others.lecture.service.ILectureService;
import kr.or.ddit.member.member.model.MemberVo;

@RequestMapping("/lecture")
@Controller
public class LectureController {
	private static final Logger logger = LoggerFactory.getLogger(LectureController.class);
	
	
	@Resource(name = "lectureService")
	private ILectureService lectureService;

	
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
	public String lectureListALL(Model model) {
		

		List<LectureVo> LectureList = lectureService.getLectureList();
		
		logger.debug("@@@@LectureList : {} ", LectureList);

		model.addAttribute("LList", LectureList);
		
		
		
		return "lecture/lectureListAll";
	
	
	}
	
	
	
	//강의 상세보기 페이지 
	

	@RequestMapping(path = "/", method = RequestMethod.GET)
	public String lecture(Model model) {
		
		return "lecture/lecture";
	
	
	}
	
	
/*
	
	
	//강의 삭제
	
	@RequestMapping(path = "/", method = RequestMethod.GET)
	public String lectureDelete(Model model) {
	
		
		logger.debug("@@@@cate_id{}",cate_id);
		
		String viewName =null;
		 int updateCnt = categoryService.deleteMajorCategory(cate_id);
		
		 if(updateCnt>=1) {
			 viewName="redirect:/category/categoryList";
		 }else {
			 viewName="redirect:/login";
		 }
		 
			return viewName;
	
	
	}
	
	
	
	
	
	//강의 사용
	
	@RequestMapping(path = "/", method = RequestMethod.GET)
	public String lectureUse(Model model) {

		
		logger.debug("@@@@cate_id{}",cate_id);
		
		String viewName =null;
		int updateCnt = categoryService.useMajorCategory(cate_id);
		
		if(updateCnt==1) {
			 viewName="redirect:/category/categoryManagement?cate_id="+cate_paerent_id;
		}else {
			viewName="redirect:/login";
		}
		
		return viewName;
		
	}
	
	
	//강의 수정
	
	
	@RequestMapping(path = "/", method = RequestMethod.GET)
	public String lectureupdate(Model model) {
		logger.debug("@@@@CategoryId{}",cate_id);
		logger.debug("@@@@CateTitle{}",cate_title);
		
		CategoryVo categoryVo= new CategoryVo(cate_id, cate_title);
		
		
		String viewName =null;
		
		int updateTitle = categoryService.updateCategoryTitle(categoryVo);
		
		if(updateTitle==1) {
			 viewName="redirect:/category/categoryManagement";
		}else {
			viewName="redirect:/login";
		}
		
		return viewName;
	}
	
	
//강의 추가 
	@RequestMapping(path = "/Insertlecture", method = RequestMethod.POST)
	public String categoryInsert(Model model, HttpSession session,RedirectAttributes redirectAttributes
		) {

		
		
		
		 int  lec_id=0;
		 int  culture_id=0;
		 String lec_nm="";
		 String lec_tea="";
		 Date lec_st_dt='19/09/22';
		 Date lec_end_dt="";
		 String lec_time="";
		 String lec_fee="";
		 String lec_day="";
		 String lec_type="";
		 String lec_amount=""; 
		 String lec_use="";
		
		LectureVo lectureVo= new LectureVo(lec_id, culture_id, lec_nm, lec_tea, lec_st_dt, lec_end_dt, lec_time, lec_fee, lec_day, lec_type, lec_amount, lec_use)
		
		
		
		String viewName =null;
		
		int insertlecture = lectureService.InsertLecture(LectureVo);
		
		if(insertCategory==1) {
			 viewName=""
		}else {
			viewName="redirect:/login";
		}
		
		return viewName;
		
	}
	
	
	*/
	
	
	
	
	
	
}
