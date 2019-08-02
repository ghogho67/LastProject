package kr.or.ddit.gold.sos.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.Socket;
import java.net.UnknownHostException;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.gold.gps.model.GpsVo;
import kr.or.ddit.gold.sos.service.ISosService;

@RequestMapping("/sos")
@Controller
public class SosController {
	private static final Logger logger = LoggerFactory.getLogger(SosController.class);

	@Resource(name = "sosService")
	private ISosService sosService;

//	@RequestMapping(path = "/sosCall")
//	public ModelAndView sosCall(@RequestParam(value = "mem_id") String mem_id, HttpServletRequest request, Model model)throws PebbleException, IOException  {
//		ModelAndView mav = new ModelAndView("send3");
//		logger.debug("!!!!!!!!!mem_id : {}", mem_id);
//		int gps_id = sosService.recentData(mem_id);
//		sosService.insertSOS(gps_id);
//		Map<String, Object>map = sosService.getGps(gps_id, mem_id);
//		GpsVo gpsVo =(GpsVo) map.get("gpsVo");
//		String mem_name =  (String) map.get("mem_name");
//		
//		mav.addObject("mem_name", mem_name);
//		mav.addObject("gpsVo", gpsVo);
//		
//		
//		logger.debug("!!!!!!!!!gpsVo : {}", gpsVo);
//		
//		return mav;
//
//	}
	@RequestMapping(path = "/sosCall")
	public String sosCall(@RequestParam(value = "mem_id") String mem_id, HttpServletRequest request, RedirectAttributes ra, Model model) {
		logger.debug("!!!!!!!!!mem_id : {}", mem_id);
		int gps_id = sosService.recentData(mem_id);
		sosService.insertSOS(gps_id);
		Map<String, Object>map = sosService.getGps(gps_id, mem_id);
		GpsVo gpsVo =(GpsVo) map.get("gpsVo");
		String mem_name =  (String) map.get("mem_name");
		
//		model.addAttribute("mem_name", mem_name);
//		model.addAttribute("gpsVo", gpsVo);
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		
		
		map2.put("lat", gpsVo.getGps_la());
		map2.put("lng", gpsVo.getGps_lo());
		map2.put("mem_name", mem_name);

//		ra.addAttribute("gps", map2);
		ra.addFlashAttribute("gps", map2);
		
		logger.debug("!!!!!!!!!gpsVo : {}", gpsVo);
		logger.debug("!!!!!!!!!gps : {}", map2);
		

//		return "sms/send_cafe";
		return "redirect:/sos/send_cafe";
		
	}
	
	
	@RequestMapping(path = "/send_cafe")
	public String send_cafe( HttpServletRequest request, RedirectAttributes ra, Model model) {

		return "forward:/send_cafe.jsp";
		
	}

	
	
	
    /**==============================================================
    Description        :  사용 함수 선언
  ==============================================================**/
   /**
   * nullcheck
   * @param str, Defaultvalue
   * @return
   */

   public static String nullcheck(String str,  String Defaultvalue ) throws Exception
   {
        String ReturnDefault = "" ;
        if (str == null)
        {
            ReturnDefault =  Defaultvalue ;
        }
        else if (str == "" )
       {
            ReturnDefault =  Defaultvalue ;
        }
        else
        {
                    ReturnDefault = str ;
        }
         return ReturnDefault ;
   }
   /**
   * BASE64 Encoder
   * @param str
   * @return
   */
  public static String base64Encode(String str)  throws java.io.IOException {
      sun.misc.BASE64Encoder encoder = new sun.misc.BASE64Encoder();
      byte[] strByte = str.getBytes();
      String result = encoder.encode(strByte);
      return result ;
  }

  /**
   * BASE64 Decoder
   * @param str
   * @return
   */
  public static String base64Decode(String str)  throws java.io.IOException {
      sun.misc.BASE64Decoder decoder = new sun.misc.BASE64Decoder();
      byte[] strByte = decoder.decodeBuffer(str);
      String result = new String(strByte);
      return result ;
  }
  
  
  
  
  
  @RequestMapping(value = "/sosSend")
	public void sendSms2(Model model, HttpServletRequest request,HttpServletResponse response ,
						String msg, String rphone, String sphone1, String sphone2, String sphone3, String rdate,
						String rtime,  String subject, String testflag, String destination, String repeatFlag, 
						String repeatNum, String repeatTime, String returnurl, String nointeractive, String smsType) throws Exception {

	  	String charsetType = "UTF-8"; //EUC-KR 또는 UTF-8

	    request.setCharacterEncoding(charsetType);
	    response.setCharacterEncoding(charsetType);
	    String  action     = nullcheck(request.getParameter("action"), "");
	    if(action.equals("go")) {

	        String sms_url = "";
	        sms_url = "https://sslsms.cafe24.com/sms_sender.php"; // SMS 전송요청 URL
	        String user_id = base64Encode("alsckd0147"); // SMS아이디
	        String secure = base64Encode("8dbe7ba5515e3ccf72c0885cef465f85");//인증키
	        msg = base64Encode(nullcheck(msg, ""));
	        rphone = base64Encode(nullcheck(rphone, ""));
	        sphone1 = base64Encode(nullcheck(sphone1, ""));
	        sphone2 = base64Encode(nullcheck(sphone2, ""));
	        sphone3 = base64Encode(nullcheck(sphone3, ""));
	        rdate = base64Encode(nullcheck(rdate, ""));
	        rtime = base64Encode(nullcheck(rtime, ""));
	        String mode = base64Encode("1");
	        subject = "";
	        if(nullcheck(request.getParameter(smsType), "").equals("L")) {
	            subject = base64Encode(nullcheck(request.getParameter(subject), ""));
	        }
	        testflag = base64Encode(nullcheck(request.getParameter(testflag), ""));
	        destination = base64Encode(nullcheck(request.getParameter(destination), ""));
	        repeatFlag = base64Encode(nullcheck(request.getParameter(repeatFlag), ""));
	        repeatNum = base64Encode(nullcheck(request.getParameter(repeatNum), ""));
	        repeatTime = base64Encode(nullcheck(request.getParameter(repeatTime), ""));
	        returnurl = nullcheck(request.getParameter(returnurl), "");
	        nointeractive = nullcheck(request.getParameter(nointeractive), "");
	        smsType = base64Encode(nullcheck(request.getParameter(smsType), ""));

	        String[] host_info = sms_url.split("/");
	        String host = host_info[2];
	        String path = "/" + host_info[3];
	        int port = 80;

	        // 데이터 맵핑 변수 정의
	        String arrKey[]
	            = new String[] {"user_id","secure","msg", "rphone","sphone1","sphone2","sphone3","rdate","rtime"
	                        ,"mode","testflag","destination","repeatFlag","repeatNum", "repeatTime", "smsType", "subject"};
	        String valKey[]= new String[arrKey.length] ;
	        valKey[0] = user_id;
	        valKey[1] = secure;
	        valKey[2] = msg;
	        valKey[3] = rphone;
	        valKey[4] = sphone1;
	        valKey[5] = sphone2;
	        valKey[6] = sphone3;
	        valKey[7] = rdate;
	        valKey[8] = rtime;
	        valKey[9] = mode;
	        valKey[10] = testflag;
	        valKey[11] = destination;
	        valKey[12] = repeatFlag;
	        valKey[13] = repeatNum;
	        valKey[14] = repeatTime;
	        valKey[15] = smsType;
	        valKey[16] = subject;
	        
	        for(int i=0; i<valKey.length; i++){
	        	System.out.println(valKey[i]);
	        }

	        String boundary = "";
	        Random rnd = new Random();
	        String rndKey = Integer.toString(rnd.nextInt(32000));
	        MessageDigest md = MessageDigest.getInstance("MD5");
	        byte[] bytData = rndKey.getBytes();
	        md.update(bytData);
	        byte[] digest = md.digest();
	        for(int i =0;i<digest.length;i++)
	        {
	            boundary = boundary + Integer.toHexString(digest[i] & 0xFF);
	        }
	        boundary = "---------------------"+boundary.substring(0,11);

	        // 본문 생성
	        String data = "";
	        String index = "";
	        String value = "";
	        for (int i=0;i<arrKey.length; i++)
	        {
	            index =  arrKey[i];
	            value = valKey[i];
	            data +="--"+boundary+"\r\n";
	            data += "Content-Disposition: form-data; name=\""+index+"\"\r\n";
	            data += "\r\n"+value+"\r\n";
	            data +="--"+boundary+"\r\n";
	        }

	        //out.println(data);

	        InetAddress addr = InetAddress.getByName(host);
	        Socket socket = new Socket(host, port);
	        // 헤더 전송
	        BufferedWriter wr = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream(), charsetType));
	        wr.write("POST "+path+" HTTP/1.0\r\n");
	        wr.write("Content-Length: "+data.length()+"\r\n");
	        wr.write("Content-type: multipart/form-data, boundary="+boundary+"\r\n");
	        wr.write("\r\n");

	        // 데이터 전송
	        wr.write(data);
	        wr.flush();

	        // 결과값 얻기
	        BufferedReader rd = new BufferedReader(new InputStreamReader(socket.getInputStream(),charsetType));
	        String line;
	        String alert = "";
	        ArrayList tmpArr = new ArrayList();
	        while ((line = rd.readLine()) != null) {
	            tmpArr.add(line);
	        }
	        wr.close();
	        rd.close();

	        String tmpMsg = (String)tmpArr.get(tmpArr.size()-1);
	        String[] rMsg = tmpMsg.split(",");
	        String Result= rMsg[0]; //발송결과
	        String Count= ""; //잔여건수
	        if(rMsg.length>1) {Count= rMsg[1]; }

	                        //발송결과 알림
	        if(Result.equals("success")) {
	            alert = "성공적으로 발송하였습니다.";
	            alert += " 잔여건수는 "+ Count+"건 입니다.";
	        }
	        else if(Result.equals("reserved")) {
	            alert = "성공적으로 예약되었습니다";
	            alert += " 잔여건수는 "+ Count+"건 입니다.";
	        }
	        else if(Result.equals("3205")) {
	            alert = "잘못된 번호형식입니다.";
	        }
	        else {
	            alert = "[Error]"+Result;
	        }
	        
	        logger.debug("!!!!!!!!alert {}",alert);

//	        out.println(nointeractive);
//
//	        if(nointeractive.equals("1") && !(Result.equals("Test Success!")) && !(Result.equals("success")) && !(Result.equals("reserved")) ) {
//	            out.println("<script>alert('" + alert + "')</script>");
//	        }
//	        else if(!(nointeractive.equals("1"))) {
//	            out.println("<script>alert('" + alert + "')</script>");
//	        }
//
//
//	        out.println("<script>location.href='"+returnurl+"';</script>");
	    }

		
	}
	
	
	
	

}
