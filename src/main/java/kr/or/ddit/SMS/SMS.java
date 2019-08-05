package kr.or.ddit.SMS;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.InetAddress;
import java.net.Socket;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

public class SMS {
	
	private static final Logger logger = LoggerFactory.getLogger(SMS.class);
	
	
	public String getAddress_DAUM(String lati, String longi) {
		 try{
	        final String APPKEY = "557fa0ec102230a199df71f4b25a1089";
	        
	        final String API_URL = "https://dapi.kakao.com/v2/local/geo/coord2address.json?x="+longi+"&y="+lati+"&input_coord=WGS84";
	       
	        HttpHeaders headers = new HttpHeaders();
	        //headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
	        headers.add("Authorization", "KakaoAK " + APPKEY);
	        
	        MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
	        parameters.add("x", longi);
	        parameters.add("y", lati);
	        parameters.add("input_coord", "WGS84");
	 
	        RestTemplate restTemplate = new RestTemplate();
	        ResponseEntity<String> result = restTemplate.exchange(API_URL ,HttpMethod.GET, new HttpEntity(headers), String.class);

	        //System.out.println(result.getBody());
	        JSONParser jsonParser = new JSONParser();
	        JSONObject jsonObject = (JSONObject) jsonParser.parse(result.getBody());
	        JSONArray jsonArray = (JSONArray)jsonObject.get("documents");
	        
	        JSONObject local = (JSONObject)jsonArray.get(0);
	        JSONObject jsonArray1 = (JSONObject)local.get("address");
	        String localAddress = (String)jsonArray1.get("address_name");
	        
	        
	        JSONObject jsonArray2 = (JSONObject)local.get("road_address");
	        String road_address = (String)jsonArray2.get("address_name");
	        
	        logger.debug("!!!!! jsonArray2 : {} ", jsonArray2);
	        String building_name = ""  ;
	        logger.debug("!!!!! jsonArray2 : {} ", jsonArray2);
	        
	        if (((String)jsonArray2.get("building_name")).length()>0 && ((String)jsonArray2.get("building_name"))!=null) {
	        	building_name = (String)jsonArray2.get("building_name");
	        }

	        road_address += " "+building_name;
	        String address = localAddress+"\r\n"+road_address;
	        
	        return address;
	       
		 }catch(Exception e){
			 e.printStackTrace();
			 return "error";
		 }
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
 
 
 
 
 
// @RequestMapping(value = "/sosSend")
	public void sendSms2(HttpServletRequest request,HttpServletResponse response ,
						String msg, String rphone, String sphone1, String sphone2, String sphone3, String rdate,
						String rtime,  String subject, String testflag, String destination, String repeatFlag, 
						String repeatNum, String repeatTime, String returnurl, String nointeractive, String smsType) throws Exception {

	  	String charsetType = "UTF-8"; //EUC-KR 또는 UTF-8
	  	logger.debug("!!!!");

	    request.setCharacterEncoding(charsetType);
	    response.setCharacterEncoding(charsetType);
	    String  action     = nullcheck("go", "");
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
	        
	        logger.debug("끝!!!");

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


	    }

		
	}

}
