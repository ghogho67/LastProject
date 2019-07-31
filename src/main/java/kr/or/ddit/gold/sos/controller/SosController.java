package kr.or.ddit.gold.sos.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.gold.sos.service.ISosService;

@RequestMapping("/sos")
@Controller
public class SosController {
	private static final Logger logger = LoggerFactory.getLogger(SosController.class);

	@Resource(name = "sosService")
	private ISosService sosService;

	@RequestMapping("/sosCall")
	public void sosCall(@RequestParam(value = "mem_id") String mem_id, HttpServletRequest request) {
		logger.debug("!!!!!!!!!mem_id : {}", mem_id);
		int gps_id = sosService.recentData(mem_id);
		sosService.insertSOS(gps_id);

	}

	@RequestMapping(value = "/sendSms")
	public void sendSms(HttpServletRequest request) throws Exception {
		String targetUrl = "http://api.solapi.com/messages/v4/send";
		String parameters = "{\"message\":{\"to\":\"01097715447\",\"from\":\"01028490809\",\"text\":\"test message\"}}";

		URL url = new URL(targetUrl);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();

		con.setRequestMethod("POST");

		con.setRequestProperty("Authorization", "NCSR1A14T9CVZMBW STSD4P8XHPVMAOHYRVHFTHICBWVSEZZO");
		con.setRequestProperty("Content-Type", "application/json");

		con.setDoOutput(true);
		DataOutputStream wr = new DataOutputStream(con.getOutputStream());
		wr.writeBytes(parameters);
		wr.flush();
		wr.close();

		int responseCode = con.getResponseCode();
		BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
		String line;
		StringBuffer response = new StringBuffer();
		while ((line = in.readLine()) != null) {
			response.append(line);
		}
		in.close();

		System.out.println("HTTP response code : " + responseCode);
		System.out.println("HTTP body : " + response.toString());
	}
	
	
	
	
	@RequestMapping(value = "/send")
	public String sendSms2(HttpServletRequest request){
		return "sms/send3";
	}

}
