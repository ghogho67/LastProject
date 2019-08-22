package kr.or.ddit.survey.controller;


import java.sql.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.category.category.model.CategoryVo;
import kr.or.ddit.category.category.service.ICategoryService;
import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.survey.model.SurveyAnswerVo;
import kr.or.ddit.survey.model.SurveyPartVo;
import kr.or.ddit.survey.model.SurveyResultVo;
import kr.or.ddit.survey.service.SurveyResult.ISurveyResultService;
import kr.or.ddit.survey.service.question.IQuestionService;
import kr.or.ddit.survey.service.survey.ISurveyService;
import kr.or.ddit.survey.service.surveyAnswer.ISurveyAnswerService;
import kr.or.ddit.survey.service.surveyPart.ISurveyPartService;
import kr.or.ddit.survey.service.video.IVideoService;

@RequestMapping("/recognition")
@Controller
public class recognitionController {
	
	
	
	@Resource(name = "questionService")
	private IQuestionService questionService;


	@Resource(name = "surveyService")
	private ISurveyService surveyService;


	@Resource(name = "surveyAnswerService")
	private ISurveyAnswerService surveyAnswerService;


	@Resource(name = "surveyPartService")
	private ISurveyPartService surveyPartService;

	@Resource(name = "surveyResultService")
	private ISurveyResultService surveyResultService;
	

	@Resource(name = "videoService")
	private IVideoService videoService;
	@Resource(name = "categoryService")
	ICategoryService categoryService;

	private static final Logger logger = LoggerFactory.getLogger(recognitionController.class);
	

	
	@RequestMapping("/semiTestStart")
	public String semiRecognitionTestStart() {
		return "recognitionActivites/semiRecognitionTestStart";
	}
	
	
	
	@RequestMapping("/semiTestQ1")
	public String TestForm(HttpSession session,Model model,
			@RequestParam(name = "sur_id")int sur_id) {
		
		int sur_part_id=0;
		
		MemberVo memvo = (MemberVo) session.getAttribute("MEM_INFO");
		String mem_id = memvo.getMem_id();
       	logger.debug("@@@@mem_id {}",mem_id);
       	logger.debug("@@@@sur_id {}",sur_id);
       	

       	//SurveyPart 내역을 생성하여 테스트 참여아이디를 생성한다 
       	SurveyPartVo surveypartVo= new SurveyPartVo(sur_part_id,sur_id,mem_id);
    	int InsertSurveyPartInfo = surveyPartService.InsertSurveyPartInfo(surveypartVo);
    	logger.debug("@@@@InsertSurveyPartInfo",InsertSurveyPartInfo);
       	
    	
    	
    	//가장 최근에 생성된 참여 아이디를 model에 넣어준다
    	SurveyPartVo getlatestSurveyPartInfo= surveyPartService.getlatestSurveyPartInfo();
    	model.addAttribute("getlatestSurveyPartInfo", getlatestSurveyPartInfo);
       	
		return "recognitionActivites/semiTestQ1";
	}

	
	
	@RequestMapping("/semiTestQ2")
	public String TestForm1(Model model,@RequestParam(name = "sur_ans_cont")String sur_ans_cont,
	    @RequestParam(name = "sur_part_id")int sur_part_id,
		@RequestParam(name = "ques_id")int ques_id) {
		
	   	logger.debug("@@@@sur_part_id {}",sur_part_id);
	   	logger.debug("@@@@ques_id {}",ques_id);
	   	logger.debug("@@@@sur_ans_cont {}",sur_ans_cont);
		
		
		
		//1번문제에 대한 답변내역과 참여아이디 문제아이디를 받아서 데이터에 추가해준다 
		SurveyAnswerVo SurveyAnswerVo= new SurveyAnswerVo(sur_part_id,ques_id,sur_ans_cont);
		int insertQuestionAns = surveyAnswerService.insertQuestionAns(SurveyAnswerVo);
		
		model.addAttribute("sur_part_id", sur_part_id);
		
		return "recognitionActivites/semiTestQ2";
	}

	
	
	
	
	@RequestMapping("/semiTestQ3")
	public String TestFosfrm(Model model,@RequestParam(name = "sur_ans_cont")String sur_ans_cont,
		    @RequestParam(name = "sur_part_id")int sur_part_id,
			@RequestParam(name = "ques_id")int ques_id) {
			
		
		
	 	logger.debug("@@@@sur_part_id {}",sur_part_id);
	   	logger.debug("@@@@ques_id {}",ques_id);
	   	logger.debug("@@@@sur_ans_cont {}",sur_ans_cont);
		
			// 2번 문제에 대한 답변내역과 참여아이디 문제아이디를 받아서 데이터에 추가해준다 
			SurveyAnswerVo SurveyAnswerVo= new SurveyAnswerVo(sur_part_id,ques_id,sur_ans_cont);
			int insertQuestionAns = surveyAnswerService.insertQuestionAns(SurveyAnswerVo);
			
			model.addAttribute("sur_part_id", sur_part_id);
			
			
		return "recognitionActivites/semiTestQ3";
	}

	
	
	
	
	
	
	
	@RequestMapping("/semiTestQ4")
	public String TestForsdfm(Model model,@RequestParam(name = "sur_ans_cont")String sur_ans_cont,
		    @RequestParam(name = "sur_part_id")int sur_part_id,
			@RequestParam(name = "ques_id")int ques_id) {
			
		
	 	logger.debug("@@@@sur_part_id {}",sur_part_id);
	   	logger.debug("@@@@ques_id {}",ques_id);
	   	logger.debug("@@@@sur_ans_cont {}",sur_ans_cont);
		
			// 3번 문제에 대한 답변내역과 참여아이디 문제아이디를 받아서 데이터에 추가해준다 
			SurveyAnswerVo SurveyAnswerVo= new SurveyAnswerVo(sur_part_id,ques_id,sur_ans_cont);
			int insertQuestionAns = surveyAnswerService.insertQuestionAns(SurveyAnswerVo);
			
			model.addAttribute("sur_part_id", sur_part_id);
			
		
		return "recognitionActivites/semiTestQ4";
	}

	
	
	
	
	@RequestMapping("/semiTestQ5")
	public String TestForsfm(Model model,@RequestParam(name = "sur_ans_cont")String sur_ans_cont,
		    @RequestParam(name = "sur_part_id")int sur_part_id,
			@RequestParam(name = "ques_id")int ques_id) {
			
		
		
	 	logger.debug("@@@@sur_part_id {}",sur_part_id);
	   	logger.debug("@@@@ques_id {}",ques_id);
	   	logger.debug("@@@@sur_ans_cont {}",sur_ans_cont);
		
			// 4번 문제에 대한 답변내역과 참여아이디 문제아이디를 받아서 데이터에 추가해준다 
			SurveyAnswerVo SurveyAnswerVo= new SurveyAnswerVo(sur_part_id,ques_id,sur_ans_cont);
			int insertQuestionAns = surveyAnswerService.insertQuestionAns(SurveyAnswerVo);
			
			model.addAttribute("sur_part_id", sur_part_id);
			
		return "recognitionActivites/semiTestQ5";
	}

	
	
	
	
	
	@RequestMapping("/semiTestResult")
	public String TestFosdfrm(Model model,HttpSession session,@RequestParam(name = "sur_ans_cont")String sur_ans_cont,
		    @RequestParam(name = "sur_part_id")int sur_part_id,
			@RequestParam(name = "ques_id")int ques_id) {
			
		
	 	logger.debug("@@@@sur_part_id {}",sur_part_id);
	   	logger.debug("@@@@ques_id {}",ques_id);
	   	logger.debug("@@@@sur_ans_cont {}",sur_ans_cont);
		
			// 5번 문제에 대한 답변내역과 참여아이디 문제아이디를 받아서 데이터에 추가해준다 
			SurveyAnswerVo SurveyAnswerVo= new SurveyAnswerVo(sur_part_id,ques_id,sur_ans_cont);
			int insertQuestionAns = surveyAnswerService.insertQuestionAns(SurveyAnswerVo);
	
			//지금까지입력한 답변값을 비교하여  정답갯수를 산출한다 
			
			int sur_id=901 ;
		
			MemberVo memvo = (MemberVo) session.getAttribute("MEM_INFO");
			String mem_id = memvo.getMem_id();
	       	logger.debug("@@@@mem_id {}",mem_id);
	       	logger.debug("@@@@sur_id {}",sur_id);
	       	
	       	SurveyPartVo surveypartVo= new SurveyPartVo(sur_part_id,sur_id,mem_id);
			
			int checkScore =surveyPartService.checkScore(surveypartVo);
			
			//결과를 저장한다
			
			
			String surresult_id ="";
			String sur_result = String.valueOf(checkScore);
			
			SurveyResultVo SurveyResultVo = new kr.or.ddit.survey.model.SurveyResultVo(surresult_id, sur_part_id, sur_result);
			int insertTestResult=surveyResultService.InsertTestResult(SurveyResultVo);
			
			if(insertTestResult==0){
				
			}
			
			
		 	logger.debug("@@@@checkScore {}",checkScore);
			model.addAttribute("checkScore", checkScore);
			
			
			String viewName;
	if(insertTestResult==0){
		viewName="main";
			}else {
				
				viewName="recognitionActivites/semiTestResult";
			}
		return viewName;
	}

	
	

	
	
	
	
	
	

	
}
