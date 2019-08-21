package kr.or.ddit.idpwFinding;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.member.member.service.IMemberService;
@RequestMapping("/find")
@Controller
public class IdpwFinding {
	private static final Logger logger = LoggerFactory.getLogger(IdpwFinding.class);
	@Resource(name = "memberService")
	private IMemberService memberService;
	
	
	@RequestMapping(path = "/idpwFind", method = RequestMethod.GET)
	public String idpwFind() {
		
		
		return "idpwFinding";
	}
	
	
	@RequestMapping(path = "/idFind", method = RequestMethod.POST)
	public String idFind(String mem_mail, String mem_nm, Model model) {
		
		
		Map<String, String> memInfo = new HashMap<String, String>();
		memInfo.put("mem_mail", mem_mail);
		memInfo.put("mem_nm", mem_nm);
		String mem_id = memberService.getMem_Id(memInfo);

		
		model.addAttribute("mem_id", mem_id);
		
		return "jsonView";
	}
	
	@RequestMapping(path = "/passFind", method = RequestMethod.POST)
	public String passFind2(String mem_mail, String mem_id, Model model) {
		int mem_pass = (int)(Math.random()*10000)+999;
		Map<String, String> memInfo = new HashMap<String, String>();
		logger.debug("☞:패스값이 값이 들어왔나요?");
		logger.debug("☞mem_mail:{}",mem_mail);
		
		MemberVo memVo = memberService.getMemVo(mem_id);
		String mail = memVo.getMem_mail();
		logger.debug("☞mail:{}",mail);
		String title = "How Care?This Care! 회원님의 임시 비밀번호를 발송하였습니다.";
		String content = "안녕하십니까? How Care?This Care! 입니다. 회원님의 임시비밀번호는"+ mem_pass +"입니다.";
		
		
		if(mem_mail.equals(memVo.getMem_mail() )) {
			memInfo.put("mem_pass", Integer.toString(mem_pass));
			memInfo.put("mem_id", mem_id);
			memberService.passUpdate(memInfo);
			
			gmailSend(mail, title, content);
			
		}else {
			String a = "기입하신 정보가 일치 하지 않습니다.";
			model.addAttribute("a",a);
			
		}
		
		return "jsonView";
	}
	

	
	
	/*
	@Autowired
	private JavaMailSenderImpl mailSender;
	public String sendMail(String mail, String title, String content){ 
		final MimeMessagePreparator preparator = new MimeMessagePreparator(){ 
		@Override 
		public void prepare(MimeMessage mimeMessage) throws Exception { 
			final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8"); 
			helper.setFrom("01051845576@gmail.com"); 
			helper.setTo(mail);
			helper.setSubject(title); 
			helper.setText(content, true); 
			} 
		};
		mailSender.send(preparator); 
		return "result"; 
	}
*/
	
	
	//SMTP 메일보내기
	public static void gmailSend(String mail, String title, String content) {
        String user = "rhkdghtkddk12@gmail.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
        String password = "dlrhkdgh12!";   // 패스워드
    

        // SMTP 서버 정보를 설정한다.
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com"); 
        prop.put("mail.smtp.port", 465); 
        prop.put("mail.smtp.auth", "true"); 
        prop.put("mail.smtp.ssl.enable", "true"); 
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        
        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));

            //수신자메일주소
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(mail)); 

            // Subject
            message.setSubject(title); //메일 제목을 입력

            // Text
            message.setText(content);    //메일 내용을 입력

            // send the message
            Transport.send(message); ////전송
        } catch (AddressException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }



	
	
}
