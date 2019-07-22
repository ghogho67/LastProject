package kr.or.ddit.idpwFinding;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.member.member.service.IMemberService;
@RequestMapping("/find")
@Controller
public class IdpwFinding {

	@Resource(name = "memService")
	private IMemberService memService;
	
	
	@RequestMapping(path = "/idFind", method = RequestMethod.GET)
	public String idFind() {
		
		
		return "idpwFinding";
	}
	
	
}
