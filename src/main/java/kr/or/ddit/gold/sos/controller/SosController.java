package kr.or.ddit.gold.sos.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.SMS.SMS;
import kr.or.ddit.gold.gps.model.GpsVo;
import kr.or.ddit.gold.sos.service.ISosService;

@RequestMapping("/sos")
@Controller
public class SosController {
	private static final Logger logger = LoggerFactory.getLogger(SosController.class);

	@Resource(name = "sosService")
	private ISosService sosService;

	
	@RequestMapping(path = "/sosCall")
	public void sosCall(@RequestParam(value = "mem_id") String mem_id, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		SMS sms = new SMS();
		logger.debug("!!!!!!!!!mem_id : {}", mem_id);
		int gps_id = sosService.recentData(mem_id);
		sosService.insertSOS(gps_id);
		Map<String, Object>map = sosService.getGps(gps_id, mem_id);
		GpsVo gpsVo =(GpsVo) map.get("gpsVo");
		String mem_name =  (String) map.get("mem_name");

		
		String lati=Double.toString(gpsVo.getGps_la());
		String longi=Double.toString(gpsVo.getGps_lo());
		
		String address = sms.getAddress_DAUM(lati, longi);
		
		String str = mem_name+"님 응급발신\r\n위치\r\n";
		String msg = str+address;
		
		logger.debug("!!! msg : {}", msg);

		sms.sendSms2(request, response, msg, "010-2849-0809", "010", "2849", "0809", null, null,"응급발신", null, null, null, null, null, null, null, "S");
		
		

		
	}

	
	
	
	

}
