package kr.or.ddit.idpwFinding;

import java.util.HashMap;

import javax.annotation.Resource;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.util.HashMap;
import org.json.simple.JSONObject;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

import kr.or.ddit.member.member.service.IMemberService;
import net.nurigo.java_sdk.Coolsms;
@RequestMapping("/find")
@Controller
public class IdpwFinding {

	@Resource(name = "memberService")
	private IMemberService memberService;
	
	
	@RequestMapping(path = "/idpwFind", method = RequestMethod.GET)
	public String idpwFind() {
		
		
		return "idpwFinding";
	}
	
	/*
	@RequestMapping(value = "/sendSMS", method = RequestMethod.POST)
	public String sendSMS(String userPhoneNumber) throws Exception { // 휴대폰 문자보내기

			String api_key = "NCS4URRUJHEIENNC";
			String api_secret = "DGHAVJKMAT91HDIKBRYOIMI3BQ63AZ9T";
		
		    Message coolsms = new Message(api_key, api_secret);

			    HashMap<String, String> params = new HashMap<String, String>();
			    params.put("to", "01051845576");
			    params.put("from", "");
			    params.put("type", "SMS");
			    params.put("text", "Coolsms Testing Message!");
			    params.put("app_version", "test app 1.2"); // application name and version

		    try {
		      JSONObject obj = (JSONObject) coolsms.send(params);
		      System.out.println(obj.toString());
		    } catch (CoolsmsException e) {
		      System.out.println(e.getMessage());
		      System.out.println(e.getCode());
		    }
			return api_secret;
		    
	}
	*/
	
}
