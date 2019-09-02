package kr.or.ddit.gold.gps.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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
import kr.or.ddit.gold.gold.model.GoldVo;
import kr.or.ddit.gold.gps.model.GpsVo;
import kr.or.ddit.gold.gps.service.IGpsService;
import kr.or.ddit.gold.sos.service.ISosService;
@RequestMapping("/gps")
@Controller
public class GpsController {
	
	
	static ArrayList<GpsVo>  list = new ArrayList<GpsVo>();
	private static final Logger logger = LoggerFactory.getLogger(GpsController.class);
	@Resource(name = "gpsService")
	private IGpsService gpsService;

	@Resource(name = "sosService")
	private ISosService sosService;
	static long insertnum=0;
	static int i=0;
   
   @RequestMapping("/insertGps")
   public void insertGps( HttpServletResponse response,@RequestParam(value = "car_bpm")int car_bpm, @RequestParam(value = "mem_id") String mem_id,
                     @RequestParam(value = "gps_lo")double gps_lo, @RequestParam(value = "gps_la")double gps_la, HttpServletRequest request) throws Exception {
      logger.debug("!!!!!!!car_bpm :{}",car_bpm);
      logger.debug("!!!!!!!gps_lo :{}",gps_lo);
      logger.debug("!!!!!!!gps_la :{}",gps_la);
      logger.debug("!!!!!!!mem_id :{}",mem_id);
      SMS sms = new SMS();
      GoldVo getMemberVo  = gpsService.getGoldMember(mem_id); 
      
      GpsVo gpsVo =  new GpsVo();
      gpsVo.setCar_bpm(car_bpm);
      if(gps_lo==1000.00000 &&gps_la==1000.00000) {
         gps_la=36.324964;
         gps_lo=127.420138;
      }
      gpsVo.setGps_la(gps_la);
      gpsVo.setGps_lo(gps_lo);
      gpsVo.setMem_id(mem_id);
      gpsVo.setGold_st(getMemberVo.getGold_st());
      if(car_bpm == 0) {
    	  if(i==0) {
    		  i++;
    	  }
    	  insertnum++;
    	  logger.debug("!!!! i :{}",i);
    	  logger.debug("!!!! insertnum :{}",insertnum);
      }
      if(insertnum==(i*10)) {
    	  i++;
    	  
    	 
    	  logger.debug("!!!!!!!!!mem_id : {}", mem_id);
    	  int gps_id = sosService.recentData(mem_id);
    	  sosService.insertSOS(gps_id);
    	  Map<String, Object>map = sosService.getGps(gps_id, mem_id);
    	  GpsVo gpsVo2 =(GpsVo) map.get("gpsVo");
    	  String mem_name =  (String) map.get("mem_name");
    	  String lati=Double.toString(gpsVo2.getGps_la());
    	  String longi=Double.toString(gpsVo2.getGps_lo());
    	  String address = sms.getAddress_DAUM(lati, longi);
    	  
    	  String str = mem_name+"님 응급발신\r\n위치\r\n";
    	  String msg = str+address;
			
    	  logger.debug("!!! msg : {}", msg);
			
    	  sms.sendSms2(request, response, msg, "010-9771-5447", "010", "2849", "0809", null, null,"응급발신", null, null, null, null, null, null, null, "S");
      }
      
      gpsService.insertGps(gpsVo);
      createGpx(gpsVo,request);
      
      
   }
   
   @RequestMapping("/getCardiac")
   public String getCardiac(Model model, String mem_id) {
      
      logger.debug("!!!!!!!mem_id :{}",mem_id);
      
      int bpm = gpsService.getCardiac(mem_id);
      logger.debug("!!!!!!!bpm :{}",bpm);
      model.addAttribute("bpm",bpm);
      return "jsonView";
   }
   
   
   public void createGpx(GpsVo gpsVo,HttpServletRequest request) {
      list.add(gpsVo);
       Date today = new Date();
       SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
       String dirPath = (String) request.getServletContext().getRealPath("/gpx");      
       date.format(today);


      try {
         
          OutputStream output = new FileOutputStream(dirPath+File.separator+date.format(today)+"_"+gpsVo.getMem_id()+".gpx");
          String str ="<?xml version=\"1.0\" encoding=\"UTF-8\"?>"+"\r\n";
          str+="<gpx xmlns=\"http://www.topografix.com/GPX/1/1\" xmlns:xalan=\"http://xml.apache.org/xalan\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" creator=\"MotionX Live\" version=\"1.1\">"+"\r\n";
          str+="<trk>";
          str+="<name>"+gpsVo.getMem_id()+"TRACK</name>";
          str+="<desc>"+date.format(today)+"</desc>";
          str+="<trkseg>";
          for(int i=0; i<list.size(); i++) {
             str+="<trkpt lat="+"\""+list.get(i).getGps_la()+"\""+" lon="+"\""+list.get(i).getGps_lo()+"\""+">"+"\r\n";
             str+="<ele></ele>"+"\r\n";
             str+="<time></time>"+"\r\n";
             str+="</trkpt>"+"\r\n";
          }
          str+="</trkseg>"+"\r\n";
          str+="</trk>"+"\r\n";
          str+="</gpx>"+"\r\n";
          
          

          
          byte[] by=str.getBytes();
          output.write(by);
            
      } catch (Exception e) {
               e.getStackTrace();
      }

   }
   @RequestMapping("/map")
   public  String map() {
      return "maps";
   }
   
   @RequestMapping("/gpxMap")
   public  String gpxMap() {
      return "gpxMaps";
   }
   
   @RequestMapping("/chart")
   public  String chart() {
      return "chart/realtime_bpm";
   }
   @RequestMapping("/chart2")
   public  String chart2(Model model, String mem_id, @RequestParam(required = false)String gps_time) {
	   long time = System.currentTimeMillis(); 

	   SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
	   GpsVo gpsVo = new GpsVo();
	   if(gps_time==null) {
		   gps_time = sdf.format(time);
	   }
	   
	   logger.debug("!!!!! gps_time : {}", gps_time);
	   gpsVo.setMem_id(mem_id);
	   gpsVo.setGps_time(gps_time);
	   
	   List<GpsVo> list = gpsService.oneDayBpm(gpsVo);
	   List<Integer> list2 = new ArrayList<Integer>();
	   for(int i=0; i<list.size(); i++) {
		   list2.add(list.get(i).getCar_bpm());
	   }
	   
	   model.addAttribute("list", list2);
	   
	   logger.debug("!!!!! list2 : {}", list2);
	   
	   return "chart/chart2";
   }

}
