package kr.or.ddit.ViewController;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.member.member.model.MemberVo;
@RequestMapping("/test")
@Controller
public class ViewController {
//	private static final Logger logger = LoggerFactory.getLogger(ViewController.class);
	
	@RequestMapping("/basicSubPage")
	public String basicSubPage() {
		return "basicSubPage.tiles";
	}
	
	@RequestMapping("/basicSubPage2")
	public String basicSubPage2() {
		return "bestSample.tiles";
	}
	
	@RequestMapping("/basicBoard")
	public String basicBoard() {
		return "/board/basicBoard.tiles";
	}
	
	@RequestMapping("/Writing")
	public String Writing() {
		return "/board/basicWriting";
	}
	
	
	
	@RequestMapping("/basicQnA")
	public String basicQnA() {
		return "/board/basicQnA.tiles";
	}
	
	@RequestMapping("/main")
	public String main() {
		return "main.tiles";
	}
	
	

	@RequestMapping("/login")
	public String login() {
		return "login.tiles";
	}
	
	@RequestMapping("/matching")
	public String matching() {
		return "/matching/matching";
	}
	
	@RequestMapping("/registrationStep1_TypeSelect")
	public String registrationStep1_TypeSelect() {
		return "/regist/registrationStep1_TypeSelect";
	}
	
	@RequestMapping("/registrationStep2_Regulation")
	public String registrationStep2_Regulation() {
		return "/regist/registrationStep2_Regulation";
	}
	
	@RequestMapping("/registrationStep3_Form")
	public String registrationStep3_Form() {
		return "/regist/registrationStep3_Form";
	}
	
	
	@RequestMapping("/registrationStep4_RecognitionTest")
	public String registrationStep4_RecognitionTest() {
		return "/regist/registrationStep4_RecognitionTest";
	}
	
	@RequestMapping("/registrationStep5_Complete")
	public String registrationStep5_Complete() {
		return "/regist/registrationStep5_Complete";
	}

	@RequestMapping("/mypage_Patient")
	public String mypage_Patient() {
		return "/mypage/mypage_Patient";
	}
	
	
	@RequestMapping("/mypage_Worker")
	public String mypage_Worker() {
		return "/mypage/mypage_Worker";
	}
	
	
	
	@RequestMapping("/mypage_Admin")
	public String mypage_Admin() {
		return "/mypage/mypage_Admin";
	}
	
	

	
	
	@RequestMapping("/serviceReport")
	public String serviceReport() {
		return "serviceReport";
	}
	
	@RequestMapping("sample")
	public String sample() {
		return "mypage/sample";
	}
	
	@RequestMapping("sample2")
	public String sample2() {
		return "mypage/sample2";
	}
	
	@RequestMapping("sample3")
	public String sample3() {
		return "mypage/sample3";
	}
	
	@RequestMapping("sample9")
	public String sample9() {
		return "mypage/sample9";
	}
	
	@RequestMapping("sample8")
	public String sample8() {
		return "mypage/sample8";
	}
	
	@RequestMapping("loginTest")
	public String loginTest() {
		return "login";
	}
	
	
	@RequestMapping("idpwFinding")
	public String idpwFinding() {
		return "idpwFinding";
	}
	
	@RequestMapping("/testof")
	public String test() {
		return "/thisTok/thistok";
	}
	
	@RequestMapping("/test")
	public String test1(HttpSession session,Model model) {
		MemberVo memVo = (MemberVo) session.getAttribute("MEM_INFO");
		String mem_id = memVo.getMem_id();
		model.addAttribute("mem_id",mem_id);
		return "/thisTok/thisTokChat";
	}
	
	

}
