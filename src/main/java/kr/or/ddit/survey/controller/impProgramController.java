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

import kr.or.ddit.category.category.model.CategoryVo;
import kr.or.ddit.category.category.service.ICategoryService;
import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.survey.model.QuestionChoiceVo;
import kr.or.ddit.survey.model.SurveyAnswerVo;
import kr.or.ddit.survey.model.SurveyPartVo;
import kr.or.ddit.survey.model.SurveyResultVo;
import kr.or.ddit.survey.model.VideoVo;
import kr.or.ddit.survey.service.SurveyResult.ISurveyResultService;
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

	
	@Resource(name = "surveyResultService")
	private ISurveyResultService surveyResultService;
	@Resource(name = "categoryService")
	ICategoryService categoryService;

	
	private static final Logger logger = LoggerFactory.getLogger(impProgramController.class);

	@RequestMapping("/impStart")
	public String impStart(int cate_id,HttpSession session) {
		
		//사이드바 처리
		List<CategoryVo> categoryList = categoryService.sideBarList(cate_id);
		session.setAttribute("sideBar",categoryList);
		
		return "recognitionActivites/improvementProgram/impStart";
	}

	@RequestMapping("/impSelectMain")
	public String impSelectMain( Model model) {
		
		List<VideoVo> videoList=videoService.getAllVideos();
		model.addAttribute("videoList", videoList);

		return "recognitionActivites/improvementProgram/impSelectMain";
	}



	@RequestMapping("/impVideo")
	public String impVideo(HttpSession session, Model model, @RequestParam(name = "sur_id") int sur_id) {

		int sur_part_id = 0;
		MemberVo memvo = (MemberVo) session.getAttribute("MEM_INFO");
		String mem_id = memvo.getMem_id();
		logger.debug("@@@@mem_id {}", mem_id);
		logger.debug("@@@@sur_id {}", sur_id);

		// SurveyPart 내역을 생성하여 테스트 참여아이디를 생성한다
		SurveyPartVo surveypartVo = new SurveyPartVo(sur_part_id, sur_id, mem_id);
		int InsertSurveyPartInfo = surveyPartService.InsertSurveyPartInfo(surveypartVo);
		logger.debug("@@@@테스트 참여아이디를 생성{}", InsertSurveyPartInfo);

		// 가장 최근에 생성된 참여 아이디를 model에 넣어준다
		SurveyPartVo getlatestSurveyPartInfo = surveyPartService.getlatestSurveyPartInfo();
		logger.debug("@@@@생성된 참여 아이디{}", getlatestSurveyPartInfo.getSur_part_id());
		model.addAttribute("sur_part_id", getlatestSurveyPartInfo.getSur_part_id());
		

		// 설문아이디에 포함된 동영상을 재생시키기 위해 동영상 정보를 가져온다
		VideoVo video = videoService.getVideo(sur_id);
		logger.debug("@@@@ 동영상 정보{}", video);

		// modle에 동영상 정보를 넣어준다
		model.addAttribute("video", video);
		
		
		model.addAttribute("sur_id", sur_id);

		return "recognitionActivites/improvementProgram/impVideo";
	}

	@RequestMapping("/impTestQ1")
	public String impTestQ1(HttpSession session, Model model, @RequestParam(name = "sur_id") int sur_id) {
		
		// 가장 최근에 생성된 참여 아이디를 model에 넣어준다
		SurveyPartVo getlatestSurveyPartInfo = surveyPartService.getlatestSurveyPartInfo();
		logger.debug("@@@@생성된 참여 아이디{}", getlatestSurveyPartInfo.getSur_part_id());
		model.addAttribute("sur_part_id", getlatestSurveyPartInfo.getSur_part_id());
		model.addAttribute("sur_id", getlatestSurveyPartInfo.getSur_id());
		

		// 해당 테스트에 대한 문제를 출력한다
		List<QuestionChoiceVo> questionsNchoices = questionService.getQuestionsAndChoices(sur_id);
		// 그중 첫번떄 문제에 대한 질문과 선택지를 가져온다
		QuestionChoiceVo ques = questionsNchoices.get(0);

		logger.debug("@@@ 문제와 예시{}", ques);
		model.addAttribute("ques", ques);

		return "recognitionActivites/improvementProgram/impTest";
	}

	@RequestMapping("/impTestQ2")
	public String impTestQ1(Model model, @RequestParam(name = "sur_ans_cont") String sur_ans_cont,
			@RequestParam(name = "sur_part_id") int sur_part_id, @RequestParam(name = "ques_id") int ques_id,
			@RequestParam(name = "sur_id") int sur_id) {

		logger.debug("@@@@sur_part_id {}", sur_part_id);
		logger.debug("@@@@ques_id {}", ques_id);
		logger.debug("@@@@sur_ans_cont {}", sur_ans_cont);

		
		// 가장 최근에 생성된 참여 아이디를 model에 넣어준다
				SurveyPartVo getlatestSurveyPartInfo = surveyPartService.getlatestSurveyPartInfo();
				logger.debug("@@@@생성된 참여 아이디{}", getlatestSurveyPartInfo.getSur_part_id());
				model.addAttribute("sur_part_id", getlatestSurveyPartInfo.getSur_part_id());
				model.addAttribute("sur_id", getlatestSurveyPartInfo.getSur_id());
				
		// 1번문제에 대한 답변내역과 참여아이디 문제아이디를 받아서 데이터에 추가해준다
		SurveyAnswerVo SurveyAnswerVo = new SurveyAnswerVo(sur_part_id, ques_id, sur_ans_cont);
		int insertQuestionAns = surveyAnswerService.insertQuestionAns(SurveyAnswerVo);
		model.addAttribute("sur_part_id", sur_part_id);

		// 해당 테스트에 대한 문제를 출력한다
		List<QuestionChoiceVo> questionsNchoices = questionService.getQuestionsAndChoices(sur_id);
		// 그중 두번째 문제에 대한 질문과 선택지를 가져온다
		QuestionChoiceVo ques = questionsNchoices.get(1);

		logger.debug("@@@ 문제와 예시 {}", ques);
		model.addAttribute("ques", ques);

		return "recognitionActivites/improvementProgram/impTest2";
	}

	
	
	@RequestMapping("/impTestQ3")
	public String impTestQ3(Model model, @RequestParam(name = "sur_ans_cont") String sur_ans_cont,
			@RequestParam(name = "sur_part_id") int sur_part_id, @RequestParam(name = "ques_id") int ques_id,
			@RequestParam(name = "sur_id") int sur_id) {

		logger.debug("@@@@sur_part_id {}", sur_part_id);
		logger.debug("@@@@ques_id {}", ques_id);
		logger.debug("@@@@sur_ans_cont {}", sur_ans_cont);

		
		// 가장 최근에 생성된 참여 아이디를 model에 넣어준다
				SurveyPartVo getlatestSurveyPartInfo = surveyPartService.getlatestSurveyPartInfo();
				logger.debug("@@@@생성된 참여 아이디{}", getlatestSurveyPartInfo.getSur_part_id());
				model.addAttribute("sur_part_id", getlatestSurveyPartInfo.getSur_part_id());
				model.addAttribute("sur_id", getlatestSurveyPartInfo.getSur_id());
				
		
		// 1번문제에 대한 답변내역과 참여아이디 문제아이디를 받아서 데이터에 추가해준다
		SurveyAnswerVo SurveyAnswerVo = new SurveyAnswerVo(sur_part_id, ques_id, sur_ans_cont);
		int insertQuestionAns = surveyAnswerService.insertQuestionAns(SurveyAnswerVo);

		model.addAttribute("sur_part_id", sur_part_id);

		// 해당 테스트에 대한 문제를 출력한다
		List<QuestionChoiceVo> questionsNchoices = questionService.getQuestionsAndChoices(sur_id);
		// 그중 3번째 문제에 대한 질문과 선택지를 가져온다
		QuestionChoiceVo ques = questionsNchoices.get(2);

		logger.debug("@@@ 문제와 예시{}", ques);
		model.addAttribute("ques", ques);

		return "recognitionActivites/improvementProgram/impTest3";
	}

	
	
	
	@RequestMapping("/impTestQ4")
	public String impTestQ4(Model model, @RequestParam(name = "sur_ans_cont") String sur_ans_cont,
			@RequestParam(name = "sur_part_id") int sur_part_id, @RequestParam(name = "ques_id") int ques_id,
			@RequestParam(name = "sur_id") int sur_id) {

		logger.debug("@@@@sur_part_id {}", sur_part_id);
		logger.debug("@@@@ques_id {}", ques_id);
		logger.debug("@@@@sur_ans_cont {}", sur_ans_cont);

		
		
		// 가장 최근에 생성된 참여 아이디를 model에 넣어준다
				SurveyPartVo getlatestSurveyPartInfo = surveyPartService.getlatestSurveyPartInfo();
				logger.debug("@@@@생성된 참여 아이디{}", getlatestSurveyPartInfo.getSur_part_id());
				model.addAttribute("sur_part_id", getlatestSurveyPartInfo.getSur_part_id());
				model.addAttribute("sur_id", getlatestSurveyPartInfo.getSur_id());
				
		
		// 1번문제에 대한 답변내역과 참여아이디 문제아이디를 받아서 데이터에 추가해준다
		SurveyAnswerVo SurveyAnswerVo = new SurveyAnswerVo(sur_part_id, ques_id, sur_ans_cont);
		int insertQuestionAns = surveyAnswerService.insertQuestionAns(SurveyAnswerVo);

		model.addAttribute("sur_part_id", sur_part_id);

		// 해당 테스트에 대한 문제를 출력한다
		List<QuestionChoiceVo> questionsNchoices = questionService.getQuestionsAndChoices(sur_id);
		// 그중 4번째 문제에 대한 질문과 선택지를 가져온다
		QuestionChoiceVo ques = questionsNchoices.get(3);

		logger.debug("@@@ 문제와 예시{}", ques);
		model.addAttribute("ques", ques);

		return "recognitionActivites/improvementProgram/impTest4";
	}

	@RequestMapping("/impTestQ5")
	public String impTestQ5(Model model, @RequestParam(name = "sur_ans_cont") String sur_ans_cont,
			@RequestParam(name = "sur_part_id") int sur_part_id, @RequestParam(name = "ques_id") int ques_id,
			@RequestParam(name = "sur_id") int sur_id) {

		logger.debug("@@@@sur_part_id {}", sur_part_id);
		logger.debug("@@@@ques_id {}", ques_id);
		logger.debug("@@@@sur_ans_cont {}", sur_ans_cont);

		
		
		// 가장 최근에 생성된 참여 아이디를 model에 넣어준다
				SurveyPartVo getlatestSurveyPartInfo = surveyPartService.getlatestSurveyPartInfo();
				logger.debug("@@@@생성된 참여 아이디{}", getlatestSurveyPartInfo.getSur_part_id());
				model.addAttribute("sur_part_id", getlatestSurveyPartInfo.getSur_part_id());
				model.addAttribute("sur_id", getlatestSurveyPartInfo.getSur_id());
				
		
		// 1번문제에 대한 답변내역과 참여아이디 문제아이디를 받아서 데이터에 추가해준다
		SurveyAnswerVo SurveyAnswerVo = new SurveyAnswerVo(sur_part_id, ques_id, sur_ans_cont);
		int insertQuestionAns = surveyAnswerService.insertQuestionAns(SurveyAnswerVo);

		model.addAttribute("sur_part_id", sur_part_id);

		// 해당 테스트에 대한 문제를 출력한다
		List<QuestionChoiceVo> questionsNchoices = questionService.getQuestionsAndChoices(sur_id);
		// 그중 5번째 문제에 대한 질문과 선택지를 가져온다
		QuestionChoiceVo ques = questionsNchoices.get(4);

		logger.debug("@@@ 문제와 예시{}", ques);
		model.addAttribute("ques", ques);

		return "recognitionActivites/improvementProgram/impTest5";
	}

	@RequestMapping("/impTestQ6")
	public String impTestQ6(Model model, @RequestParam(name = "sur_ans_cont") String sur_ans_cont,
			@RequestParam(name = "sur_part_id") int sur_part_id, @RequestParam(name = "ques_id") int ques_id,
			@RequestParam(name = "sur_id") int sur_id) {

		logger.debug("@@@@sur_part_id {}", sur_part_id);
		logger.debug("@@@@ques_id {}", ques_id);
		logger.debug("@@@@sur_ans_cont {}", sur_ans_cont);

		
		// 가장 최근에 생성된 참여 아이디를 model에 넣어준다
				SurveyPartVo getlatestSurveyPartInfo = surveyPartService.getlatestSurveyPartInfo();
				logger.debug("@@@@생성된 참여 아이디{}", getlatestSurveyPartInfo.getSur_part_id());
				model.addAttribute("sur_part_id", getlatestSurveyPartInfo.getSur_part_id());
				model.addAttribute("sur_id", getlatestSurveyPartInfo.getSur_id());
				
		
		
		// 1번문제에 대한 답변내역과 참여아이디 문제아이디를 받아서 데이터에 추가해준다
		SurveyAnswerVo SurveyAnswerVo = new SurveyAnswerVo(sur_part_id, ques_id, sur_ans_cont);
		int insertQuestionAns = surveyAnswerService.insertQuestionAns(SurveyAnswerVo);

		model.addAttribute("sur_part_id", sur_part_id);

		// 해당 테스트에 대한 문제를 출력한다
		List<QuestionChoiceVo> questionsNchoices = questionService.getQuestionsAndChoices(sur_id);
		// 그중 6번째 문제에 대한 질문과 선택지를 가져온다
		QuestionChoiceVo ques = questionsNchoices.get(5);

		logger.debug("@@@ 문제와 예시{}", ques);
		model.addAttribute("ques", ques);

		return "recognitionActivites/improvementProgram/impTest6";
	}

	@RequestMapping("/impTestQ7")
	public String impTestQ7(Model model, @RequestParam(name = "sur_ans_cont") String sur_ans_cont,
			@RequestParam(name = "sur_part_id") int sur_part_id, @RequestParam(name = "ques_id") int ques_id,
			@RequestParam(name = "sur_id") int sur_id) {

		logger.debug("@@@@sur_part_id {}", sur_part_id);
		logger.debug("@@@@ques_id {}", ques_id);
		logger.debug("@@@@sur_ans_cont {}", sur_ans_cont);

		
		// 가장 최근에 생성된 참여 아이디를 model에 넣어준다
				SurveyPartVo getlatestSurveyPartInfo = surveyPartService.getlatestSurveyPartInfo();
				logger.debug("@@@@생성된 참여 아이디{}", getlatestSurveyPartInfo.getSur_part_id());
				model.addAttribute("sur_part_id", getlatestSurveyPartInfo.getSur_part_id());
				model.addAttribute("sur_id", getlatestSurveyPartInfo.getSur_id());
				
		
		
		// 1번문제에 대한 답변내역과 참여아이디 문제아이디를 받아서 데이터에 추가해준다
		SurveyAnswerVo SurveyAnswerVo = new SurveyAnswerVo(sur_part_id, ques_id, sur_ans_cont);
		int insertQuestionAns = surveyAnswerService.insertQuestionAns(SurveyAnswerVo);

		model.addAttribute("sur_part_id", sur_part_id);

		// 해당 테스트에 대한 문제를 출력한다
		List<QuestionChoiceVo> questionsNchoices = questionService.getQuestionsAndChoices(sur_id);
		// 그중 7번째 문제에 대한 질문과 선택지를 가져온다
		QuestionChoiceVo ques = questionsNchoices.get(6);

		logger.debug("@@@ 문제와 예시{}", ques);
		model.addAttribute("ques", ques);

		return "recognitionActivites/improvementProgram/impTest7";
	}
	
	
	
	
	

	@RequestMapping("/impTestResult")
	public String impTestResult(Model model, HttpSession session,
			@RequestParam(name = "sur_ans_cont") String sur_ans_cont,
			@RequestParam(name = "sur_part_id") int sur_part_id, @RequestParam(name = "ques_id") int ques_id,
			@RequestParam(name = "sur_id") int sur_id) {

		logger.debug("@@@@sur_part_id {}", sur_part_id);
		logger.debug("@@@@ques_id {}", ques_id);
		logger.debug("@@@@sur_ans_cont {}", sur_ans_cont);

		
		
		// 가장 최근에 생성된 참여 아이디를 model에 넣어준다
				SurveyPartVo getlatestSurveyPartInfo = surveyPartService.getlatestSurveyPartInfo();
				logger.debug("@@@@생성된 참여 아이디{}", getlatestSurveyPartInfo.getSur_part_id());
				model.addAttribute("sur_part_id", getlatestSurveyPartInfo.getSur_part_id());
				model.addAttribute("sur_id", getlatestSurveyPartInfo.getSur_id());
				
		
		// 7번문제에 대한 답변내역과 참여아이디 문제아이디를 받아서 데이터에 추가해준다
		SurveyAnswerVo SurveyAnswerVo = new SurveyAnswerVo(sur_part_id, ques_id, sur_ans_cont);
		int insertQuestionAns = surveyAnswerService.insertQuestionAns(SurveyAnswerVo);

		model.addAttribute("sur_part_id", sur_part_id);

		// 지금까지입력한 답변값을 비교하여 틀린문제갯수를 산출한다

		MemberVo memvo = (MemberVo) session.getAttribute("MEM_INFO");
		String mem_id = memvo.getMem_id();
		logger.debug("@@@@mem_id {}", mem_id);
		logger.debug("@@@@sur_id {}", sur_id);

		SurveyPartVo surveypartVo = new SurveyPartVo(sur_part_id, sur_id, mem_id);

		int checkScore = surveyPartService.checkScore(surveypartVo);

		
		
		
		
		
		
		
		String surresult_id ="";
		String sur_result = String.valueOf(checkScore);
		
		SurveyResultVo SurveyResultVo = new kr.or.ddit.survey.model.SurveyResultVo(surresult_id, sur_part_id, sur_result);
		int insertTestResult=surveyResultService.InsertTestResult(SurveyResultVo);
		
		if(insertTestResult==0){
			
		}
		
		
		
		
		logger.debug("@@@@checkScore {}", checkScore);
		model.addAttribute("checkScore", checkScore);

		return "recognitionActivites/improvementProgram/impTestResult";
	}

}
