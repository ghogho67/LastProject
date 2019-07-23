package kr.or.ddit.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@RequestMapping("/mypage")
@Controller
public class mypageController {
	
	
	

	@RequestMapping("/Patient_Info")
	public String Patient_Info() {
		return "mypage/Patient_Info";
	}
	
	
	
	
	@RequestMapping("/Patient_InfoModification")
	public String Patient_InfoModification() {
		return "mypage/Patient_InfoModification";
	}
	
	
	
	@RequestMapping("/Worker_Info")
	public String Worker_Info() {
		return "mypage/Worker_Info";
	}
	
	
	
	
	@RequestMapping("/Worker_InfoModification")
	public String Worker_InfoModification() {
		return "mypage/Worker_InfoModification";
	}
	
	
	
	

	@RequestMapping("/Admin_Info")
	public String Admin_Info() {
		return "mypage/Admin_Info";
	}
	
	


}
