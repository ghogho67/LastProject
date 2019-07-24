package kr.or.ddit.recognition.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/recognition")
@Controller
public class recognitionController {
	private static final Logger logger = LoggerFactory.getLogger(recognitionController.class);

	
	
	@RequestMapping("/semiTestStart")
	public String semiRecognitionTestStart() {
		return "recognitionActivites/semiRecognitionTestStart";
	}
	
	@RequestMapping("/semiTest")
	public String semiRecognitionTest() {
		return "recognitionActivites/semiRecognitionTest";
	}
	
	@RequestMapping("/semiTest2")
	public String semiRecognitionTest2() {
		return "recognitionActivites/semiRecognitionTest2";
	}

	
	
}
