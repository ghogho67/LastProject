package kr.or.ddit.idpwFinding;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@RequestMapping("/find")
@Controller
public class IdpwFinding {

//	@Resource(name = "memberService")
//	private IMemberService memberService;
	
	
	@RequestMapping(path = "/idFind", method = RequestMethod.GET)
	public String idFind() {
		
		
		return "idpwFinding";
	}
	
	
}
