package kr.or.ddit.gold.gps.controller;

import java.io.FileOutputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.gold.gps.model.GpsVo;
import kr.or.ddit.gold.gps.service.IGpsService;
@RequestMapping("/gps")
@Controller
public class GpsController {
	static ArrayList<GpsVo>  list = new ArrayList<GpsVo>();
	private static final Logger logger = LoggerFactory.getLogger(GpsController.class);
	@Resource(name = "gpsService")
	private IGpsService gpsService;
	
	@RequestMapping("/insertGps")
	public void insertGps(  @RequestParam(value = "car_bpm")int car_bpm, @RequestParam(value = "mem_id") String mem_id,
							@RequestParam(value = "gps_lo")double gps_lo, @RequestParam(value = "gps_la")double gps_la) {
		logger.debug("!!!!!!!car_bpm :{}",car_bpm);
		logger.debug("!!!!!!!gps_lo :{}",gps_lo);
		logger.debug("!!!!!!!gps_la :{}",gps_la);
		logger.debug("!!!!!!!mem_id :{}",mem_id);
		
		GpsVo getMemberVo  = gpsService.getGoldMember(mem_id); 
		
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
		
		gpsService.insertGps(gpsVo);
		createGpx(gpsVo);
		
		
	}
	
	@RequestMapping("/getCardiac")
	public String getCardiac(Model model, String mem_id) {
		
		logger.debug("!!!!!!!mem_id :{}",mem_id);
		
		int bpm = gpsService.getCardiac(mem_id);
		logger.debug("!!!!!!!bpm :{}",bpm);
		model.addAttribute("bpm",bpm);
		return "jsonView";
	}
	
	
	public void createGpx(GpsVo gpsVo) {
		list.add(gpsVo);
		 Date today = new Date();
		 SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
		        
		    date.format(today);


		try {
			
		    OutputStream output = new FileOutputStream("D:/gpx/"+date.format(today)+"_"+gpsVo.getMem_id()+".gpx");
		    String str ="<?xml version=\"1.0\" encoding=\"UTF-8\"?>"+"\r\n";
		    str+="<gpx xmlns=\"http://www.topografix.com/GPX/1/1\" xmlns:xalan=\"http://xml.apache.org/xalan\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" creator=\"MotionX Live\" version=\"1.1\">"+"\r\n";
		    str+="<trk>";
		    str+="<name>"+gpsVo.getMem_id()+"TRACK</name>";
		    str+="<desc>"+date.format(today)+"</desc>";
		    str+="<trkseg>";
		    for(int i=0; i<list.size(); i++) {
		    	str+="<trkpt lat="+"\""+list.get(i).getGps_la()+"\""+" lon="+"\""+list.get(i).getGps_lo()+"\""+">";
		    	str+="<ele></ele>";
		    	str+="<time></time>";
		    	str+="</trkpt>";
		    }
		    str+="</trkseg>";
		    str+="</trk>";
		    str+="</gpx>";
		    
		    

		    
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

}

