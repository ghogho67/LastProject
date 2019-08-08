package kr.or.ddit.survey.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.survey.model.QuestionVo;
import kr.or.ddit.survey.model.SurveyAnswerVo;
import kr.or.ddit.survey.model.SurveyPartVo;
import kr.or.ddit.survey.model.VideoVo;
import kr.or.ddit.survey.service.question.IQuestionService;
import kr.or.ddit.survey.service.survey.ISurveyService;
import kr.or.ddit.survey.service.surveyAnswer.ISurveyAnswerService;
import kr.or.ddit.survey.service.surveyPart.ISurveyPartService;
import kr.or.ddit.survey.service.video.IVideoService;
@RequestMapping("/recognitionImp")
@Controller
public class impProgramController {
	
	@Resource(name = "questionService")
	private IQuestionService questionService;


	@Resource(name = "surveyService")
	private ISurveyService surveyService;


	@Resource(name = "surveyAnswerService")
	private ISurveyAnswerService surveyAnswerService;


	@Resource(name = "surveyPartService")
	private ISurveyPartService surveyPartService;


	@Resource(name = "videoService")
	private IVideoService videoService;
	
	private static final Logger logger = LoggerFactory.getLogger(impProgramController.class);

	
	
	
	@RequestMapping("/impStart")
	public String impStart() {
		
		
		return "recognitionActivites/improvementProgram/impStart";
	}
	
	
	
	
	@RequestMapping("/impSelectMain")
	public String impSelectMain() {
		
		
		return "recognitionActivites/improvementProgram/impSelectMain";
	}
	
	
	
	
	@RequestMapping("/impTestT")
	public String impTestQ1() {
		
		return "recognitionActivites/improvementProgram/impTestT";
	}
	
	
	
	
	
	@RequestMapping("/impVideo")
	public String impVideo(HttpSession session,Model model,
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
    	
//    	
//    	
//    	//설문아이디에 포함된 동영상을 재생시키기 위해 동영상 정보를 가져온다
//    	VideoVo video = videoService.getVideo(sur_id);
//		
//    	
//    	//modle에 동영상 정보를 넣어준다
//		model.addAttribute("video",video);
		model.addAttribute("sur_id",sur_id);
    	
		return "recognitionActivites/improvementProgram/impVideo";
	}
	
	
	
	
	@RequestMapping("/impTestQ1")
	public String impTestQ1(HttpSession session,Model model,
			@RequestParam(name = "sur_id")int sur_id) {
		
		
		//시청한 동영상을 바탕으로한 문제를 출력한다 
		List<QuestionVo> questions = questionService.getQuestions(sur_id);
	//	questions.get(0);
		
		
		
	
		
		return "recognitionActivites/improvementProgram/impTestQ1";
	}
	
	
	
	
	@RequestMapping("/impTestQ2")
	public String impTestQ1(Model model,@RequestParam(name = "sur_ans_cont")String sur_ans_cont,
		    @RequestParam(name = "sur_part_id")int sur_part_id,
			@RequestParam(name = "ques_id")int ques_id) {
			
		   	logger.debug("@@@@sur_part_id {}",sur_part_id);
		   	logger.debug("@@@@ques_id {}",ques_id);
		   	logger.debug("@@@@sur_ans_cont {}",sur_ans_cont);
			
			
			
			//1번문제에 대한 답변내역과 참여아이디 문제아이디를 받아서 데이터에 추가해준다 
			SurveyAnswerVo SurveyAnswerVo= new SurveyAnswerVo(sur_part_id,ques_id,sur_ans_cont);
			int insertQuestionAns = surveyAnswerService.insertQuestionAns(SurveyAnswerVo);
			
			model.addAttribute("sur_part_id", sur_part_id);
			
		return "recognitionActivites/improvementProgram/impTestQ2";
	}
	
	
	
	
	@RequestMapping("/impTestQ3")
	public String impTestQ3(Model model,@RequestParam(name = "sur_ans_cont")String sur_ans_cont,
		    @RequestParam(name = "sur_part_id")int sur_part_id,
			@RequestParam(name = "ques_id")int ques_id) {
			
		   	logger.debug("@@@@sur_part_id {}",sur_part_id);
		   	logger.debug("@@@@ques_id {}",ques_id);
		   	logger.debug("@@@@sur_ans_cont {}",sur_ans_cont);
			
			
			
			//1번문제에 대한 답변내역과 참여아이디 문제아이디를 받아서 데이터에 추가해준다 
			SurveyAnswerVo SurveyAnswerVo= new SurveyAnswerVo(sur_part_id,ques_id,sur_ans_cont);
			int insertQuestionAns = surveyAnswerService.insertQuestionAns(SurveyAnswerVo);
			
			model.addAttribute("sur_part_id", sur_part_id);
			
		return "recognitionActivites/improvementProgram/impTestQ3";
	}
	
	
	
	
	
	@RequestMapping("/impTestQ4")
	public String impTestQ4(Model model,@RequestParam(name = "sur_ans_cont")String sur_ans_cont,
		    @RequestParam(name = "sur_part_id")int sur_part_id,
			@RequestParam(name = "ques_id")int ques_id) {
			
		   	logger.debug("@@@@sur_part_id {}",sur_part_id);
		   	logger.debug("@@@@ques_id {}",ques_id);
		   	logger.debug("@@@@sur_ans_cont {}",sur_ans_cont);
			
			
			
			//1번문제에 대한 답변내역과 참여아이디 문제아이디를 받아서 데이터에 추가해준다 
			SurveyAnswerVo SurveyAnswerVo= new SurveyAnswerVo(sur_part_id,ques_id,sur_ans_cont);
			int insertQuestionAns = surveyAnswerService.insertQuestionAns(SurveyAnswerVo);
			
			model.addAttribute("sur_part_id", sur_part_id);
			
		return "recognitionActivites/improvementProgram/impTestQ4";
	}
	
	
	
	
	
	@RequestMapping("/impTestQ5")
	public String impTestQ5(Model model,@RequestParam(name = "sur_ans_cont")String sur_ans_cont,
		    @RequestParam(name = "sur_part_id")int sur_part_id,
			@RequestParam(name = "ques_id")int ques_id) {
			
		   	logger.debug("@@@@sur_part_id {}",sur_part_id);
		   	logger.debug("@@@@ques_id {}",ques_id);
		   	logger.debug("@@@@sur_ans_cont {}",sur_ans_cont);
			
			
			
			//1번문제에 대한 답변내역과 참여아이디 문제아이디를 받아서 데이터에 추가해준다 
			SurveyAnswerVo SurveyAnswerVo= new SurveyAnswerVo(sur_part_id,ques_id,sur_ans_cont);
			int insertQuestionAns = surveyAnswerService.insertQuestionAns(SurveyAnswerVo);
			
			model.addAttribute("sur_part_id", sur_part_id);
			
		return "recognitionActivites/improvementProgram/impTestQ5";
	}
	
	
	
	
	
	@RequestMapping("/impTestQ6")
	public String impTestQ6(Model model,@RequestParam(name = "sur_ans_cont")String sur_ans_cont,
		    @RequestParam(name = "sur_part_id")int sur_part_id,
			@RequestParam(name = "ques_id")int ques_id) {
			
		   	logger.debug("@@@@sur_part_id {}",sur_part_id);
		   	logger.debug("@@@@ques_id {}",ques_id);
		   	logger.debug("@@@@sur_ans_cont {}",sur_ans_cont);
			
			
			
			//1번문제에 대한 답변내역과 참여아이디 문제아이디를 받아서 데이터에 추가해준다 
			SurveyAnswerVo SurveyAnswerVo= new SurveyAnswerVo(sur_part_id,ques_id,sur_ans_cont);
			int insertQuestionAns = surveyAnswerService.insertQuestionAns(SurveyAnswerVo);
			
			model.addAttribute("sur_part_id", sur_part_id);
			
		return "recognitionActivites/improvementProgram/impTestQ6";
	}
	
	
	
	
	@RequestMapping("/impTestQ7")
	public String impTestQ7(Model model,@RequestParam(name = "sur_ans_cont")String sur_ans_cont,
		    @RequestParam(name = "sur_part_id")int sur_part_id,
			@RequestParam(name = "ques_id")int ques_id) {
			
		   	logger.debug("@@@@sur_part_id {}",sur_part_id);
		   	logger.debug("@@@@ques_id {}",ques_id);
		   	logger.debug("@@@@sur_ans_cont {}",sur_ans_cont);
			
			
			
			//1번문제에 대한 답변내역과 참여아이디 문제아이디를 받아서 데이터에 추가해준다 
			SurveyAnswerVo SurveyAnswerVo= new SurveyAnswerVo(sur_part_id,ques_id,sur_ans_cont);
			int insertQuestionAns = surveyAnswerService.insertQuestionAns(SurveyAnswerVo);
			
			model.addAttribute("sur_part_id", sur_part_id);
			
		return "recognitionActivites/improvementProgram/impTestQ7";
	}
	
	
	
	
	@RequestMapping("/impTestResult")
	public String impTestResult(Model model,HttpSession session,@RequestParam(name = "sur_ans_cont")String sur_ans_cont,
		    @RequestParam(name = "sur_part_id")int sur_part_id,
			@RequestParam(name = "ques_id")int ques_id) {
			
		   	logger.debug("@@@@sur_part_id {}",sur_part_id);
		   	logger.debug("@@@@ques_id {}",ques_id);
		   	logger.debug("@@@@sur_ans_cont {}",sur_ans_cont);
			
			
			
			//7번문제에 대한 답변내역과 참여아이디 문제아이디를 받아서 데이터에 추가해준다 
			SurveyAnswerVo SurveyAnswerVo= new SurveyAnswerVo(sur_part_id,ques_id,sur_ans_cont);
			int insertQuestionAns = surveyAnswerService.insertQuestionAns(SurveyAnswerVo);
			
			model.addAttribute("sur_part_id", sur_part_id);
			
			
	//지금까지입력한 답변값을 비교하여  정답갯수를 산출한다 
			
			int sur_id=901 ;
		
			MemberVo memvo = (MemberVo) session.getAttribute("MEM_INFO");
			String mem_id = memvo.getMem_id();
	       	logger.debug("@@@@mem_id {}",mem_id);
	       	logger.debug("@@@@sur_id {}",sur_id);
	       	
	       	SurveyPartVo surveypartVo= new SurveyPartVo(sur_part_id,sur_id,mem_id);
			
			int checkScore =surveyPartService.checkScore(surveypartVo);
			
		 	logger.debug("@@@@checkScore {}",checkScore);
			model.addAttribute("checkScore", checkScore);
			
			
			
		return "recognitionActivites/improvementProgram/impTestResult";
	}
	
	
	
	
}
