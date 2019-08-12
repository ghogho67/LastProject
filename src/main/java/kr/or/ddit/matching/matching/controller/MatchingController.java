package kr.or.ddit.matching.matching.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.matching.matching.model.CalendarVo;
import kr.or.ddit.matching.matching.model.MatchingVo;
import kr.or.ddit.matching.matching.service.IMatchingService;
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

	@RequestMapping(path = "/meet")
	public String meeting(Model model, String mem_id) {

		List<MatchingVo> mlist = matchingService.getMatchingList(mem_id);

		List<CalendarVo> list = new ArrayList<CalendarVo>();

		for (int i = 0; i < mlist.size(); i++) {
			CalendarVo vo = new CalendarVo();
			vo.setC_allDay(mlist.get(i).isMat_allDay());
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
		model.addAttribute("memVo", memberService.getMemVo(mem_id));
		model.addAttribute("mem_id", mem_id);
		model.addAttribute("list", matchingService.getMatchingList(mem_id));
		return "matching/meeting";
	}

	@RequestMapping(path = "/meetjson")
	public String meetjson(Model model, String mem_id) {
		model.addAttribute("list", matchingService.getMatchingList(mem_id));
		return "jsonView";
	}

	@RequestMapping(path = "/map")
	public String showMap(Model model) {
		List<MemberVo> cwList = memberService.getCwList();
		List<String> addrList = memberService.getCwaddr();
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < cwList.size(); i++) {
			list.add(cwList.get(i).getMem_id() + ":" + cwList.get(i).getMem_nm() + ": " + cwList.get(i).getMem_add1());
		}
		model.addAttribute("cwList", cwList);
		model.addAttribute("addrList", addrList);
		model.addAttribute("list", list);

		return "matching/maps";

	}

	@RequestMapping("/profile")
	public String profile(String mem_id, Model model) throws IOException {

		// 사용자 정보(path)를 조회
		MemberVo memVo = memberService.getMemVo(mem_id);
		model.addAttribute("memVo", memVo);

		return "profileView";
	}

	@RequestMapping(path = "/calendar")
	public String calendarView(Model model) {
		List<MatchingVo> mlist = matchingService.getMatchingList("brown");

		List<CalendarVo> list = new ArrayList<CalendarVo>();

		for (int i = 0; i < mlist.size(); i++) {
			CalendarVo vo = new CalendarVo();
			vo.setC_allDay(mlist.get(i).isMat_allDay());
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
	public String insertData(Model model, @RequestBody List<Map<String, Object>> list, RedirectAttributes redirect) {
		logger.debug("☞insertCalendar");
		logger.debug("☞list:{}", list);

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

		SimpleDateFormat dateFormat;

		dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm"); // 년월일 표시

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

		int compare = cal.compareTo(cal2);

		while (true) {
			for (int i = 0; i < dow.length; i++) {
				if (cal2.get(cal2.DAY_OF_WEEK) == dow[i]) {
					startDate2 = startDate2.substring(0, 10) + "T" + startDate2.substring(11, startDate2.length());
					endDate2 = startDate2.substring(0, 10) + "T" + endDate2.substring(11, endDate2.length());

					CalendarVo vo = new CalendarVo();
					vo.setC_allDay((boolean) list.get(0).get("allDay"));
					vo.setC_backgroundColor(((String) list.get(0).get("backgroundColor")));
					vo.setC_description(((String) list.get(0).get("description")));
					vo.setC_textColor(((String) list.get(0).get("textColor")));
					vo.setC_title(((String) list.get(0).get("title")));
					vo.setC_type(((String) list.get(0).get("type")));
					vo.setC_mem_id(((String) list.get(0).get("c_mem_id")));
					vo.setC_worker(((String) list.get(0).get("c_worker")));
					vo.setC_start(startDate2);
					vo.setC_end(endDate2);
					System.out.println("start: " + startDate2 + "      end : " + endDate2);
					MatchingVo mvo = new MatchingVo();
					mvo.setMat_allDay(vo.isC_allDay());
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
					logger.debug("☞mvo:{}", mvo);
					matchingService.matchingCreate(mvo);

				}
			}
			cal2.add(Calendar.DATE, 1); // 1일 더해줌
			startDate2 = dateFormat.format(cal2.getTime()); // 비교를 위한 값 셋팅

			compare = cal2.compareTo(cal);
			if (compare > 0) {
				break;
			}

		}

		redirect.addAttribute("mem_id", ((String) list.get(0).get("c_worker")));

		return "redirect:/matching/getCalendar";
	}

	@RequestMapping(path = "/updateCalendar")
	public String updateCalendar(Model model, @RequestBody List<Map<String, Object>> list) {

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
		vo.setC_allDay((boolean) list.get(0).get("allDay"));
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
		mvo.setMat_allDay(vo.isC_allDay());
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
		matchingService.matchingDelete(c_id);
		return "redirect:/getCalendar";
	}

	@RequestMapping(path = "/getCalendar")
	public String getCalendar(Model model, String mem_id) {
		
		logger.debug("☞getCalendar");
		logger.debug("☞mem_id:{}", mem_id);

		List<MatchingVo> mlist = matchingService.getMatchingList(mem_id);
		List<CalendarVo> list = new ArrayList<CalendarVo>();

		for (int i = 0; i < mlist.size(); i++) {
			CalendarVo vo = new CalendarVo();
			vo.setC_allDay(mlist.get(i).isMat_allDay());
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

	@RequestMapping(path = "/webRtc")
	public String webRtc(Model model) {
//		return "RTCMultiConnection-master/demos/dashboard/webrtc";
		return "redirect:/RTCMultiConnection-master/demos/dashboard/index.html";
	}

}
