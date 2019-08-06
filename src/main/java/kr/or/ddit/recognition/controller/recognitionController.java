package kr.or.ddit.recognition.controller;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@RequestMapping("/recognition")
@Controller
public class recognitionController {
	private static final Logger logger = LoggerFactory.getLogger(recognitionController.class);
	
//	public static List<SurveyAnswerVo> sav;

	
	
	@RequestMapping("/semiTestStart")
	public String semiRecognitionTestStart() {
		
		
		return "recognitionActivites/semiRecognitionTestStart";
	}
	
	
	
	@RequestMapping("/semiTestQ1")
	public String TestForm() {
		
		return "recognitionActivites/semiTestQ1";
	}

	
	@RequestMapping("/semiTestQ2")
	public String TestForm1() {
		
		
		return "recognitionActivites/semiTestQ2";
	}

	@RequestMapping("/semiTestQ3")
	public String TestFosfrm() {
		
		
		return "recognitionActivites/semiTestQ3";
	}

	@RequestMapping("/semiTestQ4")
	public String TestForsdfm() {
		
		
		return "recognitionActivites/semiTestQ4";
	}

	@RequestMapping("/semiTestQ5")
	public String TestForsfm() {
		
		
		return "recognitionActivites/semiTestQ5";
	}

	@RequestMapping("/semiTestResult")
	public String TestFosdfrm() {
		
		
		return "recognitionActivites/semiTestResult";
	}

	
	

	
	
	
	
	
	
	
	@RequestMapping("/answer")
	public String answer(int nextNum) {
		
	
		
		return "recognitionActivites/TestForm"+nextNum;
	}
	
	
	
}
