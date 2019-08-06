package kr.or.ddit.matching.matching.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		return "bestSample";
	}

	@RequestMapping(path = "/photo")
	public String profile(Model model, String mem_id) throws IOException {
		MemberVo memVo = memberService.getMemVo(mem_id);
		model.addAttribute("memberVo", memVo);
		return "profileView";
	}

	@RequestMapping(path = "/meet")
	public String meeting(Model model, String mem_id) {

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
//
//		GsonBuilder gsonBuilder = new GsonBuilder();
//
//		Gson gson = gsonBuilder.create();
//		String JSONOBject = gson.toJson(cwList);
//		Gson prettyGson = new GsonBuilder().setPrettyPrinting().create();
//		String cwJson = prettyGson.toJson(cwList);
//
//		logger.debug("☞cwJson:{}", cwJson);
		logger.debug("☞ cwList:{}",cwList);
		logger.debug("☞ addrList:{}",addrList);
		model.addAttribute("cwList", cwList);
		model.addAttribute("addrList", addrList);

		return "matching/maps4";

	}

	@RequestMapping("/profile")
	public String profile(String mem_id, Model model) throws IOException {

		// 사용자 정보(path)를 조회
		MemberVo memVo = memberService.getMemVo(mem_id);
		model.addAttribute("memVo", memVo);

		return "profileView";
	}

	@RequestMapping(path = "/calendar")
	public String calendarView() {
		return "FullCalendar-Example-master1/index";
	}

	@RequestMapping(path = "/insertCalendar")
	public String insertData(Model model, @RequestBody List<Map<String, Object>> list, RedirectAttributes redirectAttributes) {

		logger.debug("☞insertCalendarList:{}",list);
		
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
		cal.set(Calendar.YEAR, Integer.parseInt(((String) list.get(0).get("endDate")).substring(0, 4))); // 종료년
		cal.set(Calendar.MONTH, Integer.parseInt(((String) list.get(0).get("endDate")).substring(5, 7)) - 1); // 종료월
		cal.set(Calendar.DATE, Integer.parseInt(((String) list.get(0).get("endDate")).substring(8))); // 종료일
		cal.set(Calendar.HOUR_OF_DAY, Integer.parseInt(((String) list.get(0).get("endTime")).substring(0, 2))); // 종료시
		cal.set(Calendar.MINUTE, Integer.parseInt(((String) list.get(0).get("endTime")).substring(3))); // 종료분

		String endDate2 = dateFormat.format(cal.getTime());

		Calendar cal2 = Calendar.getInstance();
		cal2.set(Calendar.YEAR, Integer.parseInt(((String) list.get(0).get("startDate")).substring(0, 4))); // 시작년
		cal2.set(Calendar.MONTH, Integer.parseInt(((String) list.get(0).get("startDate")).substring(5, 7)) - 1); // 시작월
		cal2.set(Calendar.DATE, Integer.parseInt(((String) list.get(0).get("startDate")).substring(8))); // 시작일
		cal2.set(Calendar.HOUR_OF_DAY, Integer.parseInt(((String) list.get(0).get("startTime")).substring(0, 2))); // 시작시
		cal2.set(Calendar.MINUTE, Integer.parseInt(((String) list.get(0).get("startTime")).substring(3))); // 시작분
		String startDate2 = dateFormat.format(cal2.getTime());

		
		
		int compare = cal.compareTo(cal2);
		logger.debug("☞compare:{}", compare);
		while (true) { // 다르다면 실행, 동일 하다면 빠져나감
			for (int i = 0; i < dow.length; i++) {
				if (cal2.get(cal2.DAY_OF_WEEK) == dow[i]) {
					startDate2 = startDate2.substring(0, 10) + "T" + startDate2.substring(11, startDate2.length());
					endDate2 = startDate2.substring(0, 10) + "T" + endDate2.substring(11, endDate2.length());
					MatchingVo mvo = new MatchingVo();
					mvo.setMat_allDay((boolean) list.get(0).get("allDay"));
					mvo.setMat_bc(((String) list.get(0).get("backgroundColor")));
					mvo.setMat_cont(((String) list.get(0).get("description")));
					mvo.setMat_tc(((String) list.get(0).get("textColor")));
					mvo.setMat_title(((String) list.get(0).get("title")));
					mvo.setMat_type(((String) list.get(0).get("type")));
					mvo.setCw_mem_id("sona");
					mvo.setMem_id("brown");
					mvo.setMat_del("N");
					mvo.setMat_st(startDate2);
					mvo.setMat_end(endDate2);

					System.out.println("start: " + startDate2 + "      end : " + endDate2);
					logger.debug("☞vo:{}", mvo);
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
		redirectAttributes.addAttribute("mem_id","brown");
		return "redirect:/matching/getCalendar";
	}

//	@RequestMapping(path = "/updateCalendar")
//	public String updateCalendar(Model model, @RequestBody List<Map<String, Object>> list) {
//
//		SimpleDateFormat dateFormat;
//
//		dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm"); // 년월일 표시
//
//		Calendar cal = Calendar.getInstance();
//		cal.set(Calendar.YEAR, Integer.parseInt(((String) list.get(0).get("endDate")).substring(0, 4))); // 종료 날짜 셋팅
//		cal.set(Calendar.MONTH, Integer.parseInt(((String) list.get(0).get("endDate")).substring(5, 7)) - 1); // 종료 날짜 셋팅
//		cal.set(Calendar.DATE, Integer.parseInt(((String) list.get(0).get("endDate")).substring(8))); // 종료 날짜 셋팅
//		cal.set(Calendar.HOUR_OF_DAY, Integer.parseInt(((String) list.get(0).get("endTime")).substring(0, 2))); // 종료 날짜 셋팅
//		cal.set(Calendar.MINUTE, Integer.parseInt(((String) list.get(0).get("endTime")).substring(3))); // 종료 날짜 셋팅
//
//		String endDate2 = dateFormat.format(cal.getTime());
//
//		Calendar cal2 = Calendar.getInstance();
//		cal2.set(Calendar.YEAR, Integer.parseInt(((String) list.get(0).get("startDate")).substring(0, 4))); // 시작 날짜 셋팅
//		cal2.set(Calendar.MONTH, Integer.parseInt(((String) list.get(0).get("startDate")).substring(5, 7)) - 1); // 시작 날짜 셋팅
//		cal2.set(Calendar.DATE, Integer.parseInt(((String) list.get(0).get("startDate")).substring(8))); // 시작 시작 셋팅
//		cal2.set(Calendar.HOUR_OF_DAY, Integer.parseInt(((String) list.get(0).get("startTime")).substring(0, 2))); // 시작 날짜 셋팅
//		cal2.set(Calendar.MINUTE, Integer.parseInt(((String) list.get(0).get("startTime")).substring(3))); // 시작 날짜 셋팅
//		String startDate2 = dateFormat.format(cal2.getTime());
//
//		startDate2 = startDate2.substring(0, 10) + "T" + startDate2.substring(11, startDate2.length());
//		endDate2 = endDate2.substring(0, 10) + "T" + endDate2.substring(11, endDate2.length());
//
//		MatchingVo vo = new MatchingVo();
//		vo.setMat_allDay((boolean) list.get(0).get("allDay"));
//		vo.setMat_bc(((String) list.get(0).get("backgroundColor")));
//		vo.setMat_cont(((String) list.get(0).get("description")));
//		vo.setMat_tc(((String) list.get(0).get("textColor")));
//		vo.setMat_title(((String) list.get(0).get("title")));
//		vo.setMat_type(((String) list.get(0).get("type")));
//		vo.setCw_mem_id(((String) list.get(0).get("c_worker")));
//		vo.setMem_id(((String) list.get(0).get("c_mem_id")));
//		vo.setMat_st(startDate2);
//		vo.setMat_end(endDate2);
//
//		System.out.println("start: " + startDate2 + "      end : " + endDate2);
//		boardService.updateCalendar(vo);
//
//		return "redirect:/getCalendar";
//	}
//
//	@RequestMapping(path = "/deleteCalendar")
//	public String deleteCalendar(Model model, int c_id) {
//		logger.debug("!!!! c_id : {}", c_id);
//		boardService.deleteCalendar(c_id);
//		return "redirect:/getCalendar";
//	}
//

	/**
	 * @author PC21 수정중인 사항 2019.07.29 9:35
	 */

//	@RequestMapping(path = "/getCalendar") public String getCalendar(Model model)
//	  {
//	  List<MatchingVo> list = matchingService.getCalendar(); for (int i = 0; i <
//	  list.size(); i++) { System.out.println("list : " + list.get(i));
//	  }

	@RequestMapping(path = "/getCalendar")
	public String getCalendar(Model model, String mem_id) {
		logger.debug("☞mem_id:{}",mem_id);
		logger.debug("☞matchingService.getMatchingList(mem_id):{}",matchingService.getMatchingList(mem_id));
		model.addAttribute("list", matchingService.getMatchingList(mem_id));
		return "jsonView";
	}

}
