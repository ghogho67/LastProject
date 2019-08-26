package kr.or.ddit.matching.matching.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.category.category.service.ICategoryService;
import kr.or.ddit.matching.matching.model.CalendarVo;
import kr.or.ddit.matching.matching.model.MatchingVo;
import kr.or.ddit.matching.matching.service.IMatchingService;
import kr.or.ddit.member.careWorker.career.model.CareerVo;
import kr.or.ddit.member.careWorker.career.service.ICareerService;
import kr.or.ddit.member.careWorker.location.model.LocationVo;
import kr.or.ddit.member.careWorker.location.service.ILocationService;
import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.member.member.service.IMemberService;

@RequestMapping("/matching")
@Controller
public class MatchingController {

	private static final Logger logger = LoggerFactory.getLogger(MatchingController.class);

	@Resource(name = "matchingService")
	IMatchingService matchingService;

	@Resource(name = "memberService")
	IMemberService memberService;

	@Resource(name = "locationService")
	ILocationService locationService;

	@Resource(name = "careerService")
	ICareerService careerService;

	@Resource(name = "categoryService")
	ICategoryService categoryService;

	@RequestMapping(path = "/sample")
	public String sample() {
		return "/category/categoryList_Minor";
	}

	@RequestMapping(path = "/photo")
	public String profile(Model model, String mem_id) throws IOException {
		MemberVo memVo = memberService.getMemVo(mem_id);
		model.addAttribute("memberVo", memVo);
		return "profileView";
	}

	public List<MemberVo> selMem_gender(List<MemberVo> cwList, String mem_gender) {
		logger.debug("selMem_gender");
		logger.debug("mem_gender:{}", mem_gender);
		List<MemberVo> gList = new ArrayList<MemberVo>();

		if (mem_gender.equals("M")) {
			logger.debug("M");
			for (MemberVo mvo : cwList) {
				if (mvo.getMem_gender().equals("M"))
					gList.add(mvo);
			}
			return gList;

		} else if (mem_gender.equals("F")) {
			logger.debug("Y");
			for (MemberVo mvo : cwList) {
				if (mvo.getMem_gender().equals("F"))
					gList.add(mvo);
			}
			return gList;

		}
		return cwList;
	}

	public List<MemberVo> selCw_driver(List<MemberVo> cwList, String cw_driver) {
		logger.debug("selCw_driver");
		logger.debug("cw_driver:{}", cw_driver);
		List<MemberVo> gList = new ArrayList<MemberVo>();

		if (cw_driver.equals("N")) {
			logger.debug("N");
			for (MemberVo mvo : cwList) {
				if (mvo.getCw_driver().equals("N"))
					gList.add(mvo);
			}
			return gList;
		} else if (cw_driver.equals("Y")) {
			logger.debug("Y");
			for (MemberVo mvo : cwList) {
				if (mvo.getCw_driver().equals("Y"))
					gList.add(mvo);
			}
			return gList;
		}
		return cwList;

	}

	public List<MemberVo> selMem_birth(List<MemberVo> cwList, String mem_birth) {

		logger.debug("selMem_birth");
		List<MemberVo> list50 = new ArrayList<MemberVo>();
		List<MemberVo> list5060 = new ArrayList<MemberVo>();
		List<MemberVo> list60 = new ArrayList<MemberVo>();

		for (MemberVo mvo : cwList) {
			logger.debug("☞mvo:{}", mvo.getMem_birth());
			logger.debug("☞mvo.getMem_birth():{}", mvo.getMem_birth());
			String StringBirthYear = mvo.getMem_birth().substring(0, 4);
			String StringBirthMonth = mvo.getMem_birth().substring(5, 7);
			String StringBirthDay = mvo.getMem_birth().substring(8, 10);

			int birthYear = Integer.parseInt(StringBirthYear);
			int birthMonth = Integer.parseInt(StringBirthMonth);
			int birthDay = Integer.parseInt(StringBirthDay);

			Calendar current = Calendar.getInstance();
			int currentYear = current.get(Calendar.YEAR);
			int currentMonth = current.get(Calendar.MONTH) + 1;
			int currentDay = current.get(Calendar.DAY_OF_MONTH);

			int age = currentYear - birthYear;
			// 생일 안 지난 경우 -1
			if (birthMonth * 100 + birthDay > currentMonth * 100 + currentDay)
				age--;

			if (age < 50) {
				list50.add(mvo);
			} else if (age > 60) {
				list60.add(mvo);
			} else if (age == 50 || age == 60 || age > 50 && age < 60) {
				list5060.add(mvo);
			}

		}
		logger.debug("list50.size():{}", list50.size());
		logger.debug("list50.size():{}", list50.size());

		logger.debug("list5060.size():{}", list5060.size());
		logger.debug("list5060.size():{}", list5060.size());
		logger.debug("list60.size():{}", list60.size());
		logger.debug("list60.size():{}", list60.size());
		if (mem_birth.equals("50")) {
			return list50;
		} else if (mem_birth.equals("60")) {
			return list60;
		} else if (mem_birth.equals("5060")) {
			return list5060;
		}
		return cwList;
	}

	@RequestMapping(path = "/choose")
	public String choose(Model model, String mem_gender, String mem_birth, String cw_driver/* , String career */)
			throws IOException {

//		Calendar cal = Calendar.getInstance();
//		cal.set(Calendar.YEAR, Integer.parseInt(((String) list.get(0).get("endDate")).substring(0, 4)));
//		cal.set(Calendar.MONTH, Integer.parseInt(((String) list.get(0).get("endDate")).substring(5, 7)) - 1);
//		cal.set(Calendar.DATE, Integer.parseInt(((String) list.get(0).get("endDate")).substring(8)));
//		cal.set(Calendar.HOUR_OF_DAY, Integer.parseInt(((String) list.get(0).get("endTime")).substring(0, 2)));
//		cal.set(Calendar.MINUTE, Integer.parseInt(((String) list.get(0).get("endTime")).substring(3)));
		logger.debug("gender:{}", mem_gender);
		logger.debug("age:{}", mem_birth);
		logger.debug("driver:{}", cw_driver);
//		logger.debug("career:{}", career);
		Calendar current = Calendar.getInstance();
		int currentYear = current.get(Calendar.YEAR);
		logger.debug("☞currentYear:{}", currentYear);
		int currentMonth = current.get(Calendar.MONTH) + 1;
		logger.debug("☞currentMonth:{}", currentMonth);
		int currentDay = current.get(Calendar.DAY_OF_MONTH);
		logger.debug("☞currentDay:{}", currentDay);

		List<MemberVo> cwList = memberService.getCwList();
		logger.debug("cwList:{}", cwList);
		if (mem_birth != "all")
			cwList = selMem_birth(cwList, mem_birth);
		logger.debug("selMem_birthcwList.Size():{}", cwList.size());
		logger.debug("selMem_birthCwList:{}", cwList);
		if (mem_gender != "all")
			cwList = selMem_gender(cwList, mem_gender);
		logger.debug("selMem_gender cwList.Size():{}", cwList.size());
		logger.debug("selMem_gender cwList:{}", cwList);
		if (cw_driver != "all")
			cwList = selCw_driver(cwList, cw_driver);
		logger.debug("selCw_driver cwList.size():{}", cwList.size());
		model.addAttribute("mem_gender", mem_gender);
		model.addAttribute("mem_birth", mem_birth);
		model.addAttribute("cw_driver", cw_driver);
		model.addAttribute("cwList", cwList);
		return "/matching/maps.tiles";
	}

	@RequestMapping(path = "/dateCheck", method = RequestMethod.POST)
	public String dateCheck(Model model, String cw_mem_id, String mem_id, HttpSession session)
			throws JsonProcessingException {

		logger.debug("☞dateCheck");
		
		MemberVo memberVo = (MemberVo) session.getAttribute("MEM_INFO");
		mem_id = memberVo.getMem_id();

		
		logger.debug("☞cw_mem_id:{}",cw_mem_id);
		List<MatchingVo> mlist = matchingService.getCWMatchingList(cw_mem_id);
		logger.debug("☞mlist:{}",mlist);
		logger.debug("☞mlist.size():{}",mlist.size());
		List<CalendarVo> list = new ArrayList<CalendarVo>();

			for (int i = 0; i < mlist.size(); i++) {
			CalendarVo vo = new CalendarVo();
			
			vo.setC_start(mlist.get(i).getMat_st().substring(0, 10));
			vo.setC_end(mlist.get(i).getMat_st().substring(11, 16));

			list.add(vo);
		}

//		ObjectMapper mapper = new ObjectMapper();
//		String jsonText = mapper.writeValueAsString(list);
//		model.addAttribute("json", jsonText);
		logger.debug("☞list:{}",list);
		model.addAttribute("list", list);
//		model.addAttribute("list", matchingService.getCWMatchingList(cw_mem_id));
		return "jsonView";
	}

	@RequestMapping(path = "/meet", method = RequestMethod.GET)
	public String meeting(Model model, String cw_mem_id, String mem_id, HttpSession session)
			throws JsonProcessingException {
		
		logger.debug("☞meet");
		
		MemberVo memberVo = (MemberVo) session.getAttribute("MEM_INFO");
		mem_id = memberVo.getMem_id();

		List<MatchingVo> mlist = matchingService.getCWMatchingList(cw_mem_id);
		List<LocationVo> loList = locationService.getLocationList(cw_mem_id);
		logger.debug("loList:{}", loList);
		List<CalendarVo> list = new ArrayList<CalendarVo>();
		List<CareerVo> carList = careerService.careerList(mem_id);

		for (int i = 0; i < mlist.size(); i++) {
			CalendarVo vo = new CalendarVo();
			vo.setC_allDay(mlist.get(i).getMat_allDay());
			vo.setC_backgroundColor(mlist.get(i).getMat_bc());
			vo.setC_description(mlist.get(i).getMat_cont());
			vo.setC_textColor(mlist.get(i).getMat_tc());
			vo.setC_title(mlist.get(i).getMat_title());
			vo.setC_type(mlist.get(i).getMat_type());
			vo.setC_mem_id(mlist.get(i).getMem_id());
			vo.setC_worker(mlist.get(i).getCw_mem_id());
			vo.setC_start(mlist.get(i).getMat_st());
			vo.setC_end(mlist.get(i).getMat_end());
			list.add(vo);
		}

		ObjectMapper mapper = new ObjectMapper();
		String jsonText = mapper.writeValueAsString(list);
		model.addAttribute("json", jsonText);

		model.addAttribute("carList", carList);
		model.addAttribute("loList", loList);
		model.addAttribute("list", list);
		model.addAttribute("memVo", memberService.getMemVo(cw_mem_id));
		model.addAttribute("mem_id", mem_id);
//		model.addAttribute("list", matchingService.getCWMatchingList(cw_mem_id));
		return "matching/meeting";
	}

	@RequestMapping(path = "/meetjson")
	public String meetjson(Model model, String mem_id) {
		model.addAttribute("list", matchingService.getMemMatchingList(mem_id));
		return "jsonView";
	}

	@RequestMapping(path = "/map")
	public String showMap(Model model) {
		List<MemberVo> cwList = memberService.getCwList();
//		List<String> addrList = memberService.getCwaddr();
//		List<String> list = new ArrayList<String>();
//		for (int i = 0; i < cwList.size(); i++) {
//			list.add(cwList.get(i).getMem_id() + ":" + cwList.get(i).getMem_nm() + ": " + cwList.get(i).getMem_add1());
//		}
		model.addAttribute("cwList", cwList);
		model.addAttribute("mem_gender", "all");
		model.addAttribute("mem_birth", "all");
		model.addAttribute("cw_driver", "all");

		return "/matching/maps.tiles";

	}

	@RequestMapping("/profile")
	public String profile(String mem_id, Model model) throws IOException {

		// 사용자 정보(path)를 조회
		MemberVo memVo = memberService.getMemVo(mem_id);
		model.addAttribute("memVo", memVo);

		return "profileView";
	}

	@RequestMapping(path = "/calendar")
	public String calendarView(Model model, String mem_id) {
		List<MatchingVo> mlist = matchingService.getMemMatchingList(mem_id);

		List<CalendarVo> list = new ArrayList<CalendarVo>();

		for (int i = 0; i < mlist.size(); i++) {
			CalendarVo vo = new CalendarVo();
			vo.setC_allDay(mlist.get(i).getMat_allDay());
			vo.setC_backgroundColor(mlist.get(i).getMat_bc());
			vo.setC_description(mlist.get(i).getMat_cont());
			vo.setC_textColor(mlist.get(i).getMat_tc());
			vo.setC_title(mlist.get(i).getMat_title());
			vo.setC_type(mlist.get(i).getMat_type());
			vo.setC_mem_id(mlist.get(i).getMem_id());
			vo.setC_worker(mlist.get(i).getCw_mem_id());
			vo.setC_start(mlist.get(i).getMat_st());
			vo.setC_end(mlist.get(i).getMat_end());
			list.add(vo);
		}

		model.addAttribute("list", list);

		return "FullCalendar-Example-master/calendar";
	}

	@RequestMapping(path = "/insertCalendar")
	public String insertData(Model model, @RequestBody List<Map<String, Object>> list, RedirectAttributes redirect,
			String mem_id, HttpSession session, String endTime, String startTime) {
		
		logger.debug("☞insertCalendar");
		
		logger.debug("☞insertCalendar");
		logger.debug("☞list:{}", list);

		MemberVo memberVo = (MemberVo) session.getAttribute("MEM_INFO");
		mem_id = memberVo.getMem_id();

		String[] items = list.get(0).get("dow").toString().replaceAll("\\[", "").replaceAll("\\]", "")
				.replaceAll("\\s", "").split(",");

		int[] dow = new int[items.length];

		for (int i = 0; i < items.length; i++) {
			try {
				dow[i] = Integer.parseInt(items[i]);
			} catch (NumberFormatException nfe) {
			}
			;
		}

		String[] times = list.get(0).get("time").toString().replaceAll("\\[", "").replaceAll("\\]", "")
				.replaceAll("\\s", "").split(",");
		int[] time = new int[times.length];

		for (int i = 0; i < times.length; i++) {
			try {
				time[i] = Integer.parseInt(times[i]);
			} catch (NumberFormatException nfe) {
			}
			;
		}
		for (int timeI : time) {
			if (timeI == 1) {
				startTime = "09:00";
				endTime = "10:00";
				changeDate(endTime, startTime, dow, list, mem_id);
			}
			if (timeI == 2) {
				startTime = "10:30";
				endTime = "11:30";
				changeDate(endTime, startTime, dow, list, mem_id);
			}
			if (timeI == 3) {
				startTime = "12:00";
				endTime = "13:00";
				changeDate(endTime, startTime, dow, list, mem_id);
			}
			if (timeI == 4) {
				startTime = "13:30";
				endTime = "14:30";
				changeDate(endTime, startTime, dow, list, mem_id);
			}
			if (timeI == 5) {
				startTime = "15:00";
				endTime = "16:00";
				changeDate(endTime, startTime, dow, list, mem_id);
			}
			if (timeI == 6) {
				startTime = "16:30";
				endTime = "17:30";
				changeDate(endTime, startTime, dow, list, mem_id);
			}
		}
//		SimpleDateFormat dateFormat;
//
//		dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm"); // 년월일 표시
//
//		Calendar cal = Calendar.getInstance();
//		cal.set(Calendar.YEAR, Integer.parseInt(((String) list.get(0).get("endDate")).substring(0, 4)));
//		cal.set(Calendar.MONTH, Integer.parseInt(((String) list.get(0).get("endDate")).substring(5, 7)) - 1);
//		cal.set(Calendar.DATE, Integer.parseInt(((String) list.get(0).get("endDate")).substring(8)));
//		cal.set(Calendar.HOUR_OF_DAY, Integer.parseInt(((String) list.get(0).get("endTime")).substring(0, 2)));
//		cal.set(Calendar.MINUTE, Integer.parseInt(((String) list.get(0).get("endTime")).substring(3)));
//		String endDate2 = dateFormat.format(cal.getTime());
//		logger.debug("☞endDate2:{}", endDate2);
//
//		Calendar cal2 = Calendar.getInstance();
//		cal2.set(Calendar.YEAR, Integer.parseInt(((String) list.get(0).get("startDate")).substring(0, 4)));
//		cal2.set(Calendar.MONTH, Integer.parseInt(((String) list.get(0).get("startDate")).substring(5, 7)) - 1);
//		cal2.set(Calendar.DATE, Integer.parseInt(((String) list.get(0).get("startDate")).substring(8)));
//		cal2.set(Calendar.HOUR_OF_DAY, Integer.parseInt(((String) list.get(0).get("startTime")).substring(0, 2)));
//		cal2.set(Calendar.MINUTE, Integer.parseInt(((String) list.get(0).get("startTime")).substring(3)));
//		String startDate2 = dateFormat.format(cal2.getTime());
//		logger.debug("☞startDate2:{}", startDate2);
//		int compare = cal.compareTo(cal2);
//
//		int k = 0;
//		while (true) {
//			logger.debug("☞k:{}", k++);
//			for (int i = 0; i < dow.length; i++) {
//				if (cal2.get(cal2.DAY_OF_WEEK) == dow[i]) {
//					startDate2 = startDate2.substring(0, 10) + "T" + startDate2.substring(11, startDate2.length());
//					endDate2 = startDate2.substring(0, 10) + "T" + endDate2.substring(11, endDate2.length());
//
//					logger.debug("☞startDate2:{}", startDate2);
//					logger.debug("☞endDate2:{}", endDate2);
//					logger.debug("☞====================================================================:{}");
//
//					CalendarVo vo = new CalendarVo();
//					vo.setC_allDay("false");
//					vo.setC_backgroundColor(((String) list.get(0).get("backgroundColor")));
//					vo.setC_description(((String) list.get(0).get("description")));
//					vo.setC_textColor(((String) list.get(0).get("textColor")));
//					vo.setC_title(((String) list.get(0).get("title")));
//					vo.setC_type(((String) list.get(0).get("type")));
//					vo.setC_mem_id(mem_id);
//					vo.setC_worker(((String) list.get(0).get("c_worker")));
//					vo.setC_start(startDate2);
//					vo.setC_end(endDate2);
//					logger.debug("☞\"start: \" + startDate2 + \"      end : \" + endDate2:{}",
//							"start: " + startDate2 + "      end : " + endDate2);
//					MatchingVo mvo = new MatchingVo();
//					mvo.setMat_allDay(vo.getC_allDay());
//					mvo.setMat_bc(vo.getC_backgroundColor());
//					mvo.setMat_cont(vo.getC_description());
//					mvo.setMat_id(vo.getC_id());
//					mvo.setMat_tc(vo.getC_textColor());
//					mvo.setMat_title(vo.getC_title());
//					mvo.setMat_type(vo.getC_type());
//					mvo.setMem_id(mem_id);
//					mvo.setCw_mem_id(vo.getC_worker());
//					mvo.setMat_st(vo.getC_start());
//					mvo.setMat_end(vo.getC_end());
//					logger.debug("☞mvo:{}", mvo);
//					matchingService.matchingCreate(mvo);
//
//				}
//			}
//			cal2.add(Calendar.DATE, 1); // 1일 더해줌
//			startDate2 = dateFormat.format(cal2.getTime()); // 비교를 위한 값 셋팅
//			logger.debug("☞startDate2:{}", startDate2);
//
//			compare = cal2.compareTo(cal);
//			logger.debug("☞compare:{}", compare);
//			logger.debug("☞cal2.get(cal2.DAY_OF_WEEK):{}", cal2.get(cal2.DAY_OF_WEEK));
//			if (compare > 0) {
//				break;
//			}
//		}

		redirect.addAttribute("mem_id", ((String) list.get(0).get("c_worker")));

		return "redirect:/matching/getMemCalendar";

	}

//

	public void changeDate(String endTime, String startTime, int[] dow, @RequestBody List<Map<String, Object>> list,
			String mem_id) {
		
		logger.debug("☞changeDate");
		
		SimpleDateFormat dateFormat;
		
		

		dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm"); // 년월일 표시

		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, Integer.parseInt(((String) list.get(0).get("endDate")).substring(0, 4)));
		logger.debug("☞(String) list.get(0).get(\"endDate\"):{}", (String) list.get(0).get("endDate"));
		logger.debug("☞Integer.parseInt(((String) list.get(0).get(\"endDate\")).substring(0, 4)):{}",
				Integer.parseInt(((String) list.get(0).get("endDate")).substring(0, 4)));
		cal.set(Calendar.MONTH, Integer.parseInt(((String) list.get(0).get("endDate")).substring(5, 7)) - 1);
		logger.debug("☞Integer.parseInt(((String) list.get(0).get(\"endDate\")).substring(5, 7)) - 1:{}",
				Integer.parseInt(((String) list.get(0).get("endDate")).substring(5, 7)) - 1);
		cal.set(Calendar.DATE, Integer.parseInt(((String) list.get(0).get("endDate")).substring(8)));
		logger.debug("☞((String) list.get(0).get(\"endDate\")).substring(8)):{}",
				((String) list.get(0).get("endDate")).substring(8));
		cal.set(Calendar.HOUR_OF_DAY, Integer.parseInt(endTime.substring(0, 2)));
		logger.debug("☞Integer.parseInt(endTime.substring(0, 2)):{}", Integer.parseInt(endTime.substring(0, 2)));
		cal.set(Calendar.MINUTE, Integer.parseInt(endTime.substring(3)));
		logger.debug("☞Integer.parseInt(endTime.substring(3)):{}", Integer.parseInt(endTime.substring(3)));
		String endDate2 = dateFormat.format(cal.getTime());

		Calendar cal2 = Calendar.getInstance();
		cal2.set(Calendar.YEAR, Integer.parseInt(((String) list.get(0).get("startDate")).substring(0, 4)));
		cal2.set(Calendar.MONTH, Integer.parseInt(((String) list.get(0).get("startDate")).substring(5, 7)) - 1);
		cal2.set(Calendar.DATE, Integer.parseInt(((String) list.get(0).get("startDate")).substring(8)));
		cal2.set(Calendar.HOUR_OF_DAY, Integer.parseInt(startTime.substring(0, 2)));
		cal2.set(Calendar.MINUTE, Integer.parseInt(startTime.substring(3)));
		String startDate2 = dateFormat.format(cal2.getTime());
		int compare = cal.compareTo(cal2);

		int k = 0;
		while (true) {
			for (int i = 0; i < dow.length; i++) {
				if (cal2.get(cal2.DAY_OF_WEEK) == dow[i]) {
					startDate2 = startDate2.substring(0, 10) + "T" + startDate2.substring(11, startDate2.length());
					endDate2 = startDate2.substring(0, 10) + "T" + endDate2.substring(11, endDate2.length());
//
					CalendarVo vo = new CalendarVo();
					vo.setC_allDay("false");
					vo.setC_backgroundColor(((String) list.get(0).get("backgroundColor")));
					vo.setC_description(((String) list.get(0).get("description")));
					vo.setC_textColor(((String) list.get(0).get("textColor")));
					vo.setC_title(((String) list.get(0).get("title")));
					vo.setC_type(((String) list.get(0).get("type")));
					vo.setC_mem_id(mem_id);
					vo.setC_worker(((String) list.get(0).get("c_worker")));
					vo.setC_start(startDate2);
					vo.setC_end(endDate2);

					MatchingVo mvo = new MatchingVo();
					mvo.setMat_allDay(vo.getC_allDay());
					mvo.setMat_bc(vo.getC_backgroundColor());
					mvo.setMat_cont(vo.getC_description());
					mvo.setMat_id(vo.getC_id());
					mvo.setMat_tc(vo.getC_textColor());
					mvo.setMat_title(vo.getC_title());
					mvo.setMat_type(vo.getC_type());
					mvo.setMem_id(mem_id);
					mvo.setCw_mem_id(vo.getC_worker());
					mvo.setMat_st(vo.getC_start());
					mvo.setMat_end(vo.getC_end());
					logger.debug("☞mvo.getMat_st():{}", mvo.getMat_st());
					logger.debug("☞mvo.getMat_end():{}", mvo.getMat_end());
					matchingService.matchingCreate(mvo);

				}
			}
			cal2.add(Calendar.DATE, 1); // 1일 더해줌
			startDate2 = dateFormat.format(cal2.getTime()); // 비교를 위한 값 셋팅
//			logger.debug("☞startDate2:{}", startDate2);

			compare = cal2.compareTo(cal);
//			logger.debug("☞compare:{}", compare);
//			logger.debug("☞cal2.get(cal2.DAY_OF_WEEK):{}", cal2.get(cal2.DAY_OF_WEEK));
			if (compare > 0) {
				break;
			}
		}
	}

	@RequestMapping(path = "/updateCalendar")
	public String updateCalendar(Model model, @RequestBody List<Map<String, Object>> list) {

		logger.debug("☞updateCalendar");
		
		
		SimpleDateFormat dateFormat;

		dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, Integer.parseInt(((String) list.get(0).get("endDate")).substring(0, 4)));
		cal.set(Calendar.MONTH, Integer.parseInt(((String) list.get(0).get("endDate")).substring(5, 7)) - 1);
		cal.set(Calendar.DATE, Integer.parseInt(((String) list.get(0).get("endDate")).substring(8)));
		cal.set(Calendar.HOUR_OF_DAY, Integer.parseInt(((String) list.get(0).get("endTime")).substring(0, 2)));
		cal.set(Calendar.MINUTE, Integer.parseInt(((String) list.get(0).get("endTime")).substring(3)));
		String endDate2 = dateFormat.format(cal.getTime());

		Calendar cal2 = Calendar.getInstance();
		cal2.set(Calendar.YEAR, Integer.parseInt(((String) list.get(0).get("startDate")).substring(0, 4)));
		cal2.set(Calendar.MONTH, Integer.parseInt(((String) list.get(0).get("startDate")).substring(5, 7)) - 1);
		cal2.set(Calendar.DATE, Integer.parseInt(((String) list.get(0).get("startDate")).substring(8)));
		cal2.set(Calendar.HOUR_OF_DAY, Integer.parseInt(((String) list.get(0).get("startTime")).substring(0, 2)));
		cal2.set(Calendar.MINUTE, Integer.parseInt(((String) list.get(0).get("startTime")).substring(3)));
		String startDate2 = dateFormat.format(cal2.getTime());

		startDate2 = startDate2.substring(0, 10) + "T" + startDate2.substring(11, startDate2.length());
		endDate2 = endDate2.substring(0, 10) + "T" + endDate2.substring(11, endDate2.length());

		CalendarVo vo = new CalendarVo();
		vo.setC_allDay((String) list.get(0).get("allDay"));
		vo.setC_backgroundColor(((String) list.get(0).get("backgroundColor")));
		vo.setC_description(((String) list.get(0).get("description")));
		vo.setC_id(Integer.parseInt((String) list.get(0).get("_id")));
		vo.setC_textColor(((String) list.get(0).get("textColor")));
		vo.setC_title(((String) list.get(0).get("title")));
		vo.setC_type(((String) list.get(0).get("type")));
		vo.setC_mem_id(((String) list.get(0).get("c_mem_id")));
		vo.setC_worker(((String) list.get(0).get("c_worker")));
		vo.setC_start(startDate2);
		vo.setC_end(endDate2);

		MatchingVo mvo = new MatchingVo();
		mvo.setMat_allDay(vo.getC_allDay());
		mvo.setMat_bc(vo.getC_backgroundColor());
		mvo.setMat_cont(vo.getC_description());
		mvo.setMat_id(vo.getC_id());
		mvo.setMat_tc(vo.getC_textColor());
		mvo.setMat_title(vo.getC_title());
		mvo.setMat_type(vo.getC_type());
		mvo.setMem_id(vo.getC_mem_id());
		mvo.setCw_mem_id(vo.getC_worker());
		mvo.setMat_st(vo.getC_start());
		mvo.setMat_end(vo.getC_end());

		int updateCnt = matchingService.matchingModify(mvo);
		return "redirect:/matching/getCalendar";
	}

	@RequestMapping(path = "/deleteCalendar")
	public String deleteCalendar(Model model, int c_id) {
		
		logger.debug("☞deleteCalendar");
		
		matchingService.matchingDelete(c_id);
		return "redirect:/getCalendar";
	}

//	@RequestMapping(path = "/getCalendar")
//	public String getCalendar(Model model, String mem_id) {
//
//		logger.debug("☞getCalendar");
//		logger.debug("☞mem_id:{}", mem_id);
//
//		List<MatchingVo> mlist = matchingService.getMemMatchingList(mem_id);
//		List<CalendarVo> list = new ArrayList<CalendarVo>();
//
//		logger.debug("mList:{}", mlist);
//		for (int i = 0; i < mlist.size(); i++) {
//			CalendarVo vo = new CalendarVo();
//			vo.setC_allDay(mlist.get(i).getMat_allDay());
//			vo.setC_backgroundColor(mlist.get(i).getMat_bc());
//			vo.setC_description(mlist.get(i).getMat_cont());
//			vo.setC_textColor(mlist.get(i).getMat_tc());
//			vo.setC_title(mlist.get(i).getMat_title());
//			vo.setC_type(mlist.get(i).getMat_type());
//			vo.setC_mem_id(mlist.get(i).getMem_id());
//			vo.setC_worker(mlist.get(i).getCw_mem_id());
//			vo.setC_start(mlist.get(i).getMat_st());
//			vo.setC_end(mlist.get(i).getMat_end());
//			list.add(vo);
//		}
//
//		model.addAttribute("list", list);
//
//		return "jsonView";
//
//	}

	@RequestMapping(path = "/getMemCalendar")
	public String getMemCalendar(Model model, String mem_id) {

		logger.debug("☞getCalendar");
		logger.debug("☞mem_id:{}", mem_id);

		List<MatchingVo> mlist = matchingService.getMemMatchingList(mem_id);
		List<CalendarVo> list = new ArrayList<CalendarVo>();

		logger.debug("mList:{}", mlist);
		for (int i = 0; i < mlist.size(); i++) {
			CalendarVo vo = new CalendarVo();
			vo.setC_allDay(mlist.get(i).getMat_allDay());
			vo.setC_backgroundColor(mlist.get(i).getMat_bc());
			vo.setC_description(mlist.get(i).getMat_cont());
			vo.setC_textColor(mlist.get(i).getMat_tc());
			vo.setC_title(mlist.get(i).getMat_title());
			vo.setC_type(mlist.get(i).getMat_type());
			vo.setC_mem_id(mlist.get(i).getMem_id());
			vo.setC_worker(mlist.get(i).getCw_mem_id());
			vo.setC_start(mlist.get(i).getMat_st());
			vo.setC_end(mlist.get(i).getMat_end());
			list.add(vo);
		}

		model.addAttribute("list", list);

		return "jsonView";

	}

	@RequestMapping(path = "/getCWCalendar")
	public String getCWCalendar(Model model, String cw_mem_id) {

		logger.debug("☞getCalendar");
		logger.debug("☞mem_id:{}", cw_mem_id);

		List<MatchingVo> mlist = matchingService.getCWMatchingList(cw_mem_id);
		List<CalendarVo> list = new ArrayList<CalendarVo>();

		for (int i = 0; i < mlist.size(); i++) {
			CalendarVo vo = new CalendarVo();
			vo.setC_allDay(mlist.get(i).getMat_allDay());
			vo.setC_backgroundColor(mlist.get(i).getMat_bc());
			vo.setC_description(mlist.get(i).getMat_cont());
			vo.setC_textColor(mlist.get(i).getMat_tc());
			vo.setC_title(mlist.get(i).getMat_title());
			vo.setC_type(mlist.get(i).getMat_type());
			vo.setC_mem_id(mlist.get(i).getMem_id());
			vo.setC_worker(mlist.get(i).getCw_mem_id());
			vo.setC_start(mlist.get(i).getMat_st());
			vo.setC_end(mlist.get(i).getMat_end());
			list.add(vo);
		}

		logger.debug("list:{}", list);

		model.addAttribute("list", list);

		return "jsonView";

	}

	@RequestMapping(path = "/webRtc")
	public String webRtc(Model model) {
//		return "RTCMultiConnection-master/demos/dashboard/webrtc";
		return "redirect:/RTCMultiConnection-master/demos/dashboard/index.html";
	}
	//

}
