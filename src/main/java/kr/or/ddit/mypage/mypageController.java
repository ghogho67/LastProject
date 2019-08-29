package kr.or.ddit.mypage;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.gold.gps.model.GpsVo;
import kr.or.ddit.gold.gps.service.IGpsService;
import kr.or.ddit.gold.sos.service.ISosService;
import kr.or.ddit.matching.grade.service.IGradeService;
import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.member.member.service.IMemberService;
import kr.or.ddit.page.model.PageVo;
import kr.or.ddit.survey.model.SurveyPartVo;
import kr.or.ddit.survey.model.SurveyResultVo;
import kr.or.ddit.survey.service.SurveyResult.ISurveyResultService;
import kr.or.ddit.survey.service.surveyPart.ISurveyPartService;
import kr.or.ddit.util.PartUtil;

@RequestMapping("/mypage")
@Controller
public class mypageController {
	private static final Logger logger = LoggerFactory.getLogger(mypageController.class);

	@Resource(name = "memberService")
	private IMemberService memberService;

	@Resource(name = "gradeService")
	private IGradeService gradeService;

	@Resource(name = "gpsService")
	private IGpsService gpsService;

	@Resource(name = "sosService")
	private ISosService sosService;

	@Resource(name = "surveyPartService")
	private ISurveyPartService surveyPartService;

	@Resource(name = "surveyResultService")
	private ISurveyResultService surveyResultService;

	@RequestMapping("/Patient_Info")
	public String Patient_Info() {
		return "/mypage/Patient_Info.mytiles";
	}

	/**
	 * Method : Patient_InfoModification 작성자 : 오도아 변경이력 :
	 * 
	 * @return Method 설명 : 마이페이지 대상자 정보 출력
	 */
	@RequestMapping(path = "/Patient_InfoModification", method = RequestMethod.GET)
	public String Patient_InfoModification() {
		return "mypage/Patient_InfoModification";
	}

	/**
	 * Method : Patient_InfoModification 작성자 : 오도아 변경이력 :
	 * 
	 * @param model
	 * @param profile
	 * @param session
	 * @param redirectAttributes
	 * @param request
	 * @param mem_id
	 * @param grade
	 * @param mem_pass
	 * @param mem_mail
	 * @param mem_phone
	 * @param mem_zipcd
	 * @param mem_add1
	 * @param mem_add2
	 * @param pro_relation
	 * @param pro_nm
	 * @param pro_phone
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException           Method 설명 :마이페이지 대상자 정보 출력
	 */
	@RequestMapping(path = "/Patient_InfoModification", method = RequestMethod.POST)
	public String Patient_InfoModification(Model model, MultipartFile profile, HttpSession session,
			RedirectAttributes redirectAttributes, HttpServletRequest request,
			@RequestParam(name = "memid") String mem_id, @RequestParam(name = "grade") String grade,
			@RequestParam(name = "pass") String mem_pass, @RequestParam(name = "email") String mem_mail,
			@RequestParam(name = "phone") String mem_phone, @RequestParam(name = "zipcd") String mem_zipcd,
			@RequestParam(name = "addr1") String mem_add1, @RequestParam(name = "addr2") String mem_add2,
			@RequestParam(name = "pro_relation") String pro_relation, @RequestParam(name = "pro_nm") String pro_nm,
			@RequestParam(name = "pro_phone") String pro_phone) throws IllegalStateException, IOException {

		String viewName;

		String mem_nm = "";
		String mem_birth = "";
		String mem_gender = "";
		String mem_del = "";
		String mem_grade = "";
		String cw_driver = "";
		String cw_lic = "";
		String mem_photo_path = "";
		String mem_photo_nm = "";

		logger.debug("@@@@grade : {} ", grade);
		logger.debug("@@@@mem_pass : {} ", mem_pass);
		logger.debug("@@@@mem_mail : {} ", mem_mail);
		logger.debug("@@@@mem_phone : {} ", mem_phone);
		logger.debug("mem_zipcd : {} ", mem_zipcd);
		logger.debug("mem_add1 : {} ", mem_add1);
		logger.debug("mem_add2 : {} ", mem_add2);
		logger.debug("@@@@pro_relation : {} ", pro_relation);
		logger.debug("@@@@pro_nm : {} ", pro_nm);
		logger.debug("@@@@pro_phone : {} ", pro_phone);

		MemberVo memberVo = null;

		if (profile.getSize() > 0) {
			String fileName = profile.getOriginalFilename();
			String ext = PartUtil.getExt(fileName);

			String uploadPath = PartUtil.getUploadPath();

			String filePath = uploadPath + File.separator + UUID.randomUUID().toString() + ext;

			mem_photo_path = filePath;
			mem_photo_nm = fileName;

			profile.transferTo(new File(filePath));

		}

		if (grade.equals("3") == false) {

			memberVo = new MemberVo(mem_id, mem_nm, mem_birth, mem_gender, mem_pass, mem_phone, mem_add1, mem_add2,
					mem_zipcd, mem_mail, mem_grade, mem_del, mem_photo_path, mem_photo_nm, pro_relation, pro_nm,
					pro_phone, cw_driver, cw_lic);

			int updateCnt = memberService.updatePMember(memberVo);

			logger.debug("@@@@updateCnt : {} ", updateCnt);

			if (updateCnt != 1) {
				viewName = "redirect:/login";
			}
			memberVo = memberService.getMemVo(mem_id);
			session.setAttribute("MEM_INFO", memberVo);

			viewName = "/mypage/Patient_Info.mytiles";

		} else {
			viewName = "redirect:/main";
		}

		logger.debug("@@@@viewName : {} ", viewName);
		return viewName;
	}

	/**
	 * Method : Worker_Info 작성자 : 이광호 변경이력 : 2019.07.25
	 * 
	 * @param session
	 * @param model
	 * @return Method 설명 : 요양보호사 회원정보 화면에서 평가점수 출력 추가
	 */
	@RequestMapping("/Worker_Info")
	public String Worker_Info(HttpSession session, Model model) {
		MemberVo memvo = (MemberVo) session.getAttribute("MEM_INFO");
		String mem_id = memvo.getMem_id();
		String grades = gradeService.cwGradeAvg(mem_id);
		if (grades == null) {
			grades = "0.0";
			model.addAttribute("grades", grades);
		} else {
			model.addAttribute("grades", grades);
		}

		return "/mypage/Worker_Info.mytiles";
	}

	/**
	 * Method : Worker_InfoModification 작성자 : 오도아 변경이력 :
	 * 
	 * @return Method 설명 : 마이페잊 요양보호사 정보 출력
	 */
	@RequestMapping(path = "/Worker_InfoModification", method = RequestMethod.GET)
	public String Worker_InfoModification() {
		return "/mypage/Worker_InfoModification.mytiles";
	}

	@RequestMapping(path = "/Worker_InfoModification", method = RequestMethod.POST)
	public String Worker_InfoModification(Model model, MultipartFile profile, HttpSession session,
			RedirectAttributes redirectAttributes, HttpServletRequest request,
			@RequestParam(name = "memid") String mem_id, @RequestParam(name = "grade") String grade,
			@RequestParam(name = "pass") String mem_pass, @RequestParam(name = "email") String mem_mail,
			@RequestParam(name = "phone") String mem_phone, @RequestParam(name = "zipcd") String mem_zipcd,
			@RequestParam(name = "addr1") String mem_add1, @RequestParam(name = "addr2") String mem_add2)
			throws IllegalStateException, IOException {

		String viewName;

		String mem_nm = "";
		String mem_birth = "";
		String mem_gender = "";
		String mem_del = "";
		String mem_grade = "";
		String cw_driver = "";
		String cw_lic = "";
		String mem_photo_path = "";
		String mem_photo_nm = "";
		String pro_relation = "";
		String pro_nm = "";
		String pro_phone = "";

		logger.debug("@@@@grade : {} ", grade);
		logger.debug("@@@@mem_pass : {} ", mem_pass);
		logger.debug("@@@@mem_mail : {} ", mem_mail);
		logger.debug("@@@@mem_phone : {} ", mem_phone);
		logger.debug("mem_zipcd : {} ", mem_zipcd);
		logger.debug("mem_add1 : {} ", mem_add1);
		logger.debug("mem_add2 : {} ", mem_add2);

		MemberVo updateMember = null;

		if (profile.getSize() > 0) {
			String fileName = profile.getOriginalFilename();
			String ext = PartUtil.getExt(fileName);

			String uploadPath = PartUtil.getUploadPath();

			String filePath = uploadPath + File.separator + UUID.randomUUID().toString() + ext;

			mem_photo_path = filePath;
			mem_photo_nm = fileName;

			profile.transferTo(new File(filePath));

		}

		if (grade.equals("3")) {

			updateMember = new MemberVo(mem_id, mem_nm, mem_birth, mem_gender, mem_pass, mem_phone, mem_add1, mem_add2,
					mem_zipcd, mem_mail, mem_grade, mem_del, mem_photo_path, mem_photo_nm, pro_relation, pro_nm,
					pro_phone, cw_driver, cw_lic);

			int updateCnt = memberService.updateMember(updateMember);

			if (updateCnt != 1) {
				viewName = "redirect:/login";
			}
			MemberVo memberVo = memberService.getMemVo(mem_id);

			session.setAttribute("MEM_INFO", memberVo);
			logger.debug("☞memberVo:{}", memberVo);
//			model.addAttribute("MEM_INFO", memberVo);
			viewName = "/mypage/Worker_Info.mytiles";
		} else {

			viewName = "redirect:/login";
		}
		logger.debug("☞viewName:{}", viewName);

		return viewName;
	}

	@RequestMapping("/Admin_Info")
	public String Admin_Info() {
		return "/mypage/Admin_Info.mytiles";
	}

	@RequestMapping("/scheduleView")
	public String scheduleView(HttpSession session, Model model) {
		logger.debug("☞schedule");
		MemberVo memvo = (MemberVo) session.getAttribute("MEM_INFO");
		String mem_id = memvo.getMem_id();
		model.addAttribute("mem_id", mem_id);

		return "/mypage/schedule.mytiles";
	}

	@RequestMapping("/schedule")
	public String schedule(HttpSession session, Model model) {
		logger.debug("☞schedule");
		MemberVo memvo = (MemberVo) session.getAttribute("MEM_INFO");
		String mem_id = memvo.getMem_id();
		model.addAttribute("mem_id", mem_id);

		return "jsonView";
	}

	/**
	 * Method : Patient_Wd 작성자 : 오도아 변경이력 :
	 * 
	 * @return Method 설명 : 마이페이지 대상자 탈퇴
	 */
	@RequestMapping(path = "/Patient_Wd", method = RequestMethod.GET)
	public String Patient_Wdl() {
		return "mypage/Patient_Wd";
	}

	/**
	 * Method : Patient_withdrawal 작성자 : 오도아 변경이력 :
	 * 
	 * @param model
	 * @param session
	 * @param redirectAttributes
	 * @param request
	 * @param mem_id
	 * @param mem_pass
	 * @param input_id
	 * @param input_pass
	 * @return Method 설명 : 마이페이지 대상자 탈퇴
	 */
	@RequestMapping(path = "/Patient_Wd", method = RequestMethod.POST)
	public String Patient_withdrawal(Model model, HttpSession session, RedirectAttributes redirectAttributes,
			HttpServletRequest request, @RequestParam(name = "memid") String mem_id,
			@RequestParam(name = "mempass") String mem_pass, @RequestParam(name = "id") String input_id,
			@RequestParam(name = "pass") String input_pass) {

		logger.debug("@@@@mem_id : {} ", mem_id);
		logger.debug("@@@@input_id : {} ", input_id);
		logger.debug("@@@@mem_pass : {} ", mem_pass);
		logger.debug("@@@@input_pass : {} ", input_pass);

		String viewName;

		String mem_nm = "";
		String mem_birth = "";
		String mem_gender = "";
		String mem_del = "";
		String mem_grade = "";
		String cw_driver = "";
		String cw_lic = "";
		String mem_photo_path = "";
		String mem_photo_nm = "";
		String pro_relation = "";
		String pro_nm = "";
		String pro_phone = "";
		String mem_zipcd = "";
		String mem_mail = "";
		String mem_phone = "";
		String mem_add1 = "";
		String mem_add2 = "";

		MemberVo memberVo = null;

		if (mem_id.equals(input_id) && mem_pass.equals(input_pass)) {

			logger.debug("탈퇴");

			mem_del = "Y";
			memberVo = new MemberVo(mem_id, mem_nm, mem_birth, mem_gender, mem_pass, mem_phone, mem_add1, mem_add2,
					mem_zipcd, mem_mail, mem_grade, mem_del, mem_photo_path, mem_photo_nm, pro_relation, pro_nm,
					pro_phone, cw_driver, cw_lic);

			int updateCnt = memberService.withdrwalMember(memberVo);
			logger.debug("@@@@updateCnt", updateCnt);

			if (updateCnt == 1) {
//				session.setAttribute("MEM_INFO", memberVo);
				session.invalidate();
				viewName = "redirect:/login";

			} else {
				viewName = "redirect:/main";
			}

		} else
			viewName = "redirect:/main";

		return viewName;
	}

	/**
	 * Method : Worker_Wd 작성자 : 오도아 변경이력 :
	 * 
	 * @return Method 설명 : 요양보호사 회원탈퇴
	 */
	@RequestMapping(path = "/Worker_Wd", method = RequestMethod.GET)
	public String Worker_Wd() {
		return "mypage/Worker_Wd";
	}

	@RequestMapping(path = "/Worker_Wd", method = RequestMethod.POST)
	public String Worker_withdrawal(Model model, HttpSession session, RedirectAttributes redirectAttributes,
			HttpServletRequest request, @RequestParam(name = "memid") String mem_id,
			@RequestParam(name = "mempass") String mem_pass, @RequestParam(name = "id") String input_id,
			@RequestParam(name = "pass") String input_pass) {

		logger.debug("@@@@mem_id : {} ", mem_id);
		logger.debug("@@@@input_id : {} ", input_id);
		logger.debug("@@@@mem_pass : {} ", mem_pass);
		logger.debug("@@@@input_pass : {} ", input_pass);

		String viewName;

		String mem_nm = "";
		String mem_birth = "";
		String mem_gender = "";
		String mem_del = "";
		String mem_grade = "";
		String cw_driver = "";
		String cw_lic = "";
		String mem_photo_path = "";
		String mem_photo_nm = "";
		String pro_relation = "";
		String pro_nm = "";
		String pro_phone = "";
		String mem_zipcd = "";
		String mem_mail = "";
		String mem_phone = "";
		String mem_add1 = "";
		String mem_add2 = "";

		MemberVo memberVo = null;

		if (mem_id.equals(input_id) && mem_pass.equals(input_pass)) {

			logger.debug("탈퇴");

			mem_del = "Y";
			memberVo = new MemberVo(mem_id, mem_nm, mem_birth, mem_gender, mem_pass, mem_phone, mem_add1, mem_add2,
					mem_zipcd, mem_mail, mem_grade, mem_del, mem_photo_path, mem_photo_nm, pro_relation, pro_nm,
					pro_phone, cw_driver, cw_lic);

			int updateCnt = memberService.withdrwalMember(memberVo);
			logger.debug("@@@@updateCnt", updateCnt);

			if (updateCnt == 1) {
//				session.setAttribute("MEM_INFO", memberVo);
				session.invalidate();
				viewName = "redirect:/login";

			} else {
				viewName = "redirect:/main";
			}

		} else
			viewName = "redirect:/main";

		return viewName;
	}

	/**
	 * Method : chart2 작성자 : PC24 변경이력 :
	 * 
	 * @param model
	 * @param mem_id
	 * @param gps_time
	 * @return Method 설명 : 스트레스 지수 확인
	 */
	@RequestMapping("/stress")
	public String chart2(Model model, String mem_id, @RequestParam(required = false) String gps_time) {
		long time = System.currentTimeMillis();

		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		GpsVo gpsVo = new GpsVo();
		if (gps_time == null) {
			gps_time = sdf.format(time);
		}

		logger.debug("!!!!! gps_time : {}", gps_time);
		gpsVo.setMem_id(mem_id);
		gpsVo.setGps_time(gps_time);

		List<GpsVo> list = gpsService.oneDayBpm(gpsVo);
		List<Integer> list2 = new ArrayList<Integer>();
		for (int i = 0; i < list.size(); i++) {
			list2.add(list.get(i).getCar_bpm());
		}

		model.addAttribute("list", list2);

		logger.debug("!!!!! list2 : {}", list2);

		return "mypage/gold/stress";
	}

	/**
	 * Method : chart2 작성자 : PC24 변경이력 :
	 * 
	 * @param model
	 * @param mem_id
	 * @param gps_time
	 * @return Method 설명 : 스트레스 지수 ajax
	 */
	@RequestMapping("/reChart")
	public String reChart(Model model, String mem_id, @RequestParam(required = false) String gps_time) {
		long time = System.currentTimeMillis();

		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		GpsVo gpsVo = new GpsVo();
		if (gps_time == null) {
			gps_time = sdf.format(time);

		}

		logger.debug("!!!!! gps_time : {}", gps_time);
		gpsVo.setMem_id(mem_id);
		gpsVo.setGps_time(gps_time);

		List<GpsVo> list = gpsService.oneDayBpm(gpsVo);
		List<Integer> list2 = new ArrayList<Integer>();
		for (int i = 0; i < list.size(); i++) {
			list2.add(list.get(i).getCar_bpm());
		}


		model.addAttribute("list", list2);

		logger.debug("!!!!! list2 : {}", list2);

		return "jsonView";
	}

	@RequestMapping("/getCardiac")
	public String getCardiac(Model model, String mem_id) {

		logger.debug("!!!!!!!mem_id :{}", mem_id);

		int bpm = gpsService.getCardiac(mem_id);
		logger.debug("!!!!!!!bpm :{}", bpm);
		model.addAttribute("bpm", bpm);
		return "jsonView";
	}

	@RequestMapping("/realBpm")
	public String realBpm(Model model, String mem_id) {

		model.addAttribute("mem_id", mem_id);
		return "mypage/gold/realtime_bpm";
	}

	@RequestMapping("/gpxMap")
	   public String gpxMap(Model model, String mem_id) {
	      GpsVo gpsVo = new GpsVo();
	      if(sosService.gpsCnt(mem_id)==0) {
	         gpsVo.setGps_la(36.325072);
	         gpsVo.setGps_lo(127.420319);
	      }else {
	         
	         int gps_id = sosService.recentData(mem_id);
	         Map<String, Object> map = sosService.getGps(gps_id, mem_id);
	         gpsVo = (GpsVo) map.get("gpsVo");
	         String mem_name = (String) map.get("mem_name");
	      }


	      model.addAttribute("gpsVo", gpsVo);

	      return "mypage/gold/gpxMap";
	   }

	/**
	 * Method : memberPagingList 작성자 : ADMIN 변경이력 :
	 * 
	 * @return Method 설명 :회원관리 - 회원목록
	 */
	@RequestMapping("/pagingList")
	public String memberPagingList(Model model, PageVo pageVo, int page, int pageSize) {

		pageVo = new PageVo();
		pageVo.setPage(page);
		pageVo.setPageSize(pageSize);

		Map<String, Object> resultMap = memberService.getAllMemberList(pageVo);

		logger.debug("☞resultMap:{}", resultMap);

		List<MemberVo> getMemList = (List<MemberVo>) resultMap.get("getMemList");

		int startPage = ((int) Math.floor((pageVo.getPage() - 1) / 10)) + 1;
		if (pageVo.getPage() == 1) {
			startPage = 1;
		}
		if (startPage >= 2) {
			startPage = ((int) Math.floor((pageVo.getPage() - 1) / 10) * 10) + 1;
		}
		int paginationSize = ((int) Math.floor((pageVo.getPage() - 1) / 10 + 1)) * 10;

		int lastpaginationSize = (int) resultMap.get("lastpaginationSize");

		if (((int) Math.floor((pageVo.getPage() - 1) / 10 + 1)) * 10 > lastpaginationSize) {
			paginationSize = lastpaginationSize;
		}

		logger.debug("☞getMemList:{}", getMemList);

		model.addAttribute("getMemList", getMemList);
		model.addAttribute("startPage", startPage);
		model.addAttribute("paginationSize", paginationSize);
		model.addAttribute("lastpaginationSize", lastpaginationSize);
		model.addAttribute("pageVo", pageVo);

		logger.debug("☞getMemList:{}", getMemList);
		logger.debug("☞paginationSize:{}", paginationSize);
		logger.debug("☞pageVo:{}", pageVo);

		// 구글 pie chart API
		model.addAttribute("manager", memberService.memberGradeCnt("0"));
		model.addAttribute("nomalMember", memberService.memberGradeCnt("1"));
		model.addAttribute("goldMember", memberService.memberGradeCnt("2"));
		model.addAttribute("careWorker", memberService.memberGradeCnt("3"));

		return "/mypage/memberManage/memberPagingList.mytiles";
	}

	@RequestMapping("/recognitionActResult")
	public String recognitionActResult(HttpSession session, Model model) {

		MemberVo memvo = (MemberVo) session.getAttribute("MEM_INFO");
		String mem_id = memvo.getMem_id();

		// 간이인지 테스트 결과
		int sur_id = 901;
		SurveyPartVo SurveyPartVo = new SurveyPartVo(sur_id, mem_id);
		List<SurveyResultVo> getCertainTestResult = surveyResultService.getCertainTestResult(SurveyPartVo);

		// 전체 인지테스트 전체 결과와 시간
		List<SurveyResultVo> getTestResultVos = surveyResultService.getTestResult(mem_id);
		List<String> sur_timeList = new ArrayList<String>();
		List<String> sur_resultList = new ArrayList<String>();
		for (int i = 0; i < getTestResultVos.size(); i++) {
			sur_resultList.add(getTestResultVos.get(i).getSur_result());
			sur_timeList.add(getTestResultVos.get(i).getSur_time());
		}

		model.addAttribute("getCertainTestResult", getCertainTestResult);
		model.addAttribute("getTestResultVos", getTestResultVos);

		model.addAttribute("sur_resultList", sur_resultList);
		model.addAttribute("sur_timeList", sur_timeList);
		logger.debug("!!!!!sur_resultList : {}", sur_resultList);
		logger.debug("!!!!!sur_timeList : {}", sur_timeList);

		return "mypage/gold/recognitionActResult2";
	}

	@RequestMapping("/recognitionActResult2")
	public String recognitionActResult2(HttpSession session, Model model) {

		MemberVo memvo = (MemberVo) session.getAttribute("MEM_INFO");
		String mem_id = memvo.getMem_id();

		return "mypage/gold/recognitionActResult2";
	}
	
	@RequestMapping("cctv")
	public String CCTV(String open, String sessionid, String publicRoomIdentifier, String userFullName) {
		return"RTCMultiConnection-master/demos/dashboard/cctv";
	}


}
