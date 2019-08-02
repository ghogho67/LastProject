package kr.or.ddit.category.others.lecture.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.category.others.lecture.model.LectureVo;
import kr.or.ddit.category.others.lecture.service.ILectureService;

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
	
	
	
	

	@RequestMapping(path = "/", method = RequestMethod.GET)
	public String lecture(Model model) {
		


		
		return "lecture/lecture";
	
	
	}
	
	
	
	
	
}
