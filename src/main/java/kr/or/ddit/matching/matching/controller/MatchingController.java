package kr.or.ddit.matching.matching.controller;

import java.text.SimpleDateFormat;
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

import kr.or.ddit.matching.matching.model.MatchingVo;
import kr.or.ddit.matching.matching.service.IMatchingService;

@RequestMapping("/matching")
@Controller
public class MatchingController {

	private static final Logger logger = LoggerFactory.getLogger(MatchingController.class);

	@Resource(name = "matchingService")
	IMatchingService matchingService;

	@RequestMapping(path = "calendar")
	public String calendarView() {
		return "FullCalendar-Example-master/calendar";
	}

	@RequestMapping(path = "/insertCalendar")
	public String insertData(Model model, @RequestBody List<Map<String, Object>> list) {

		logger.debug("☞list:{}", list);
		String[] items = list.get(0).get("dow").toString().replaceAll("\\[", "").replaceAll("\\]", "").replaceAll("\\s", "").split(",");

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
		cal.set(Calendar.YEAR, Integer.parseInt(((String) list.get(0).get("endDate")).substring(0, 4))); // 종료날짜셋팅
		cal.set(Calendar.MONTH, Integer.parseInt(((String) list.get(0).get("endDate")).substring(5, 7)) - 1); // 종료날짜셋팅
		cal.set(Calendar.DATE, Integer.parseInt(((String) list.get(0).get("endDate")).substring(8))); // 종료날짜셋팅
		cal.set(Calendar.HOUR_OF_DAY, Integer.parseInt(((String) list.get(0).get("endTime")).substring(0, 2))); // 종료날짜셋팅
		cal.set(Calendar.MINUTE, Integer.parseInt(((String) list.get(0).get("endTime")).substring(3))); // 종료 날짜 셋팅

		String endDate2 = dateFormat.format(cal.getTime());

		Calendar cal2 = Calendar.getInstance();
		cal2.set(Calendar.YEAR, Integer.parseInt(((String) list.get(0).get("startDate")).substring(0, 4))); // 시작 날짜 셋팅
		cal2.set(Calendar.MONTH, Integer.parseInt(((String) list.get(0).get("startDate")).substring(5, 7)) - 1); // 시작날짜셋팅
		cal2.set(Calendar.DATE, Integer.parseInt(((String) list.get(0).get("startDate")).substring(8))); // 시작 시작 셋팅
		cal2.set(Calendar.HOUR_OF_DAY, Integer.parseInt(((String) list.get(0).get("startTime")).substring(0, 2))); // 시작날짜셋팅
		cal2.set(Calendar.MINUTE, Integer.parseInt(((String) list.get(0).get("startTime")).substring(3))); // 시작날짜셋팅
		String startDate2 = dateFormat.format(cal2.getTime());

		int compare = cal.compareTo(cal2);

		while (true) { // 다르다면 실행, 동일 하다면 빠져나감
			for (int i = 0; i < dow.length; i++) {
				if (cal2.get(cal2.DAY_OF_WEEK) == dow[i]) {
					startDate2 = startDate2.substring(0, 10) + "T" + startDate2.substring(11, startDate2.length());
					endDate2 = startDate2.substring(0, 10) + "T" + endDate2.substring(11, endDate2.length());

					MatchingVo vo = new MatchingVo();
					vo.setMat_allDay((boolean) list.get(0).get("allDay"));
					vo.setMat_bc(((String) list.get(0).get("backgroundColor")));
					vo.setMat_cont(((String) list.get(0).get("description")));
					vo.setMat_tc(((String) list.get(0).get("textColor")));
					vo.setMat_title(((String) list.get(0).get("title")));
					vo.setMat_type(((String) list.get(0).get("type")));
					vo.setCw_mem_id(((String) list.get(0).get("c_worker")));
					vo.setMem_id(((String) list.get(0).get("c_mem_id")));
					vo.setMat_st(startDate2);
					vo.setMat_end(endDate2);

					System.out.println("start: " + startDate2 + "      end : " + endDate2);

				}
			}
			cal2.add(Calendar.DATE, 1); // 1일 더해줌
			startDate2 = dateFormat.format(cal2.getTime()); // 비교를 위한 값 셋팅

			compare = cal2.compareTo(cal);
			if (compare > 0) {
				break;
			}

		}

		return "redirect:/getCalendar";
	}

//
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
////		logger.debug("!!!! c_id : {}", c_id);
//		boardService.deleteCalendar(c_id);
//		return "redirect:/getCalendar";
//	}
//
//	@RequestMapping(path = "/getCalendar")
//	public String getCalendar(Model model) {
//
//		List<MatchingVo> list = boardService.getCalendar();
//		for (int i = 0; i < list.size(); i++) {
//			System.out.println("list : " + list.get(i));
//
//		}
//
//		Map<String, Object> map = new HashMap<String, Object>();
//		for (int i = 0; i < list.size(); i++) {
//			map.put("_id", list.get(i).getMat_id());
//			map.put("backgroundColor", list.get(i).getMat_bc());
//			map.put("description", list.get(i).getMat_cont());
//			map.put("end", list.get(i).getMat_end());
//			map.put("start", list.get(i).getMat_st());
//			map.put("textColor", list.get(i).getMat_tc());
//			map.put("title", list.get(i).getMat_title());
//			map.put("type", list.get(i).getMat_type());
//			map.put("c_mem_id", list.get(i).getMem_id());
//			map.put("c_worker", list.get(i).getCw_mem_id());
//			map.put("allday", list.get(i).isMat_allDay());
//		}
//		model.addAttribute("list", list);
//
//		return "jsonView";
//
//	}

}
