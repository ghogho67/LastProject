package kr.or.ddit.register.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.ParseException;
import java.util.Date;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.encrypt.kisa.sha256.KISA_SHA256;
import kr.or.ddit.joinVo.RegisterVo;
import kr.or.ddit.member.careWorker.career.model.CareerVo;
import kr.or.ddit.member.careWorker.cwServiceType.model.CwServiceTypeVo;
import kr.or.ddit.member.careWorker.day.model.DayVo;
import kr.or.ddit.member.careWorker.hospital.model.HospitalVo;
import kr.or.ddit.member.careWorker.location.model.LocationVo;
import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.member.memberDisease.model.MemberDiseaseVo;
import kr.or.ddit.register.service.IRegisterService;
import kr.or.ddit.util.PartUtil;
import kr.or.ddit.util.RegCheck;

@RequestMapping("/regist")
@Controller
public class RegisterController {
	private static final Logger logger = LoggerFactory.getLogger(RegisterController.class);
	@Resource(name = "registerService")
	public IRegisterService registerService;
	@Resource(name = "regCheck")
	public RegCheck regCheck;

	/**
	 * Method : regist 작성자 : ADMIN 변경이력 :
	 * 
	 * @return Method 설명 : 로그인 화면요청
	 */
	@RequestMapping(path = "/regist1", method = RequestMethod.GET)
	public String regist() {

		return "/regist/registrationStep1_TypeSelect";
	}

	/**
	 * Method : regist1 작성자 : ADMIN 변경이력 :
	 * 
	 * @return Method 설명 : 로그인 화면 처리
	 */
	@RequestMapping(path = "/regist1", method = RequestMethod.POST)
	public String regist1() {

		return "/regist/registrationStep1_TypeSelect";
	}

	/**
	 * Method : registNotice 작성자 : ADMIN 변경이력 :
	 * 
	 * @return Method 설명 : 일반회원 약관 요청
	 */
	@RequestMapping(path = "/regist2", method = RequestMethod.GET)
	public String registNotice() {

		return "/regist/registrationStep2_Regulation";
	}

	/**
	 * Method : registNotice1 작성자 : ADMIN 변경이력 :
	 * 
	 * @return Method 설명 :일반회원 약관 동의
	 */
	@RequestMapping(path = "/regist2", method = RequestMethod.POST)
	public String registNotice1() {

		return "/regist/registrationStep2_Regulation";
	}

	/**
	 * Method : idCheck 작성자 : ADMIN 변경이력 :
	 * 
	 * @return Method 설명 :아이디 중복체크 요청
	 */
//	@RequestMapping(path = "/idCheck", method = RequestMethod.GET)
//	public String idCheck() {
//		
//		return "/regist/registrationStep3_Form";
//	}

	/**
	 * Method : idCheck 작성자 : ADMIN 변경이력 :
	 * 
	 * @param mem_id
	 * @param model
	 * @return Method 설명 : 아이디 중복체크 처리, 정규식 처리
	 */
	@RequestMapping(path = "/idCheck")
	public String idCheck(String mem_id, Model model) {

		logger.debug("!!!!!mem_id : {}", mem_id);
		String str = "";
		int idCnt = registerService.idCheck(mem_id);

		boolean idCheck = regCheck.regId(mem_id);
		logger.debug("!!!! idCheck : {} ", idCheck);
		if (idCheck == false) {
			logger.debug("!!!! 정규식 에러");
			model.addAttribute("mem_id", "mem_id");
			return "jsonView";
		}

		if (idCnt == 1) {
			str = "no"; // 존재
		} else {
			str = "yes"; // 사용가능
		}

		logger.debug("!!!!!str : {}", str);
		model.addAttribute("mem_id", str);

		return "jsonView";
	}

	/**
	 * Method : registNotice1 작성자 : ADMIN 변경이력 :
	 * 
	 * @return Method 설명 :일반회원 정보입력 요청
	 */
	@RequestMapping(path = "/regist3", method = RequestMethod.GET)
	public String insertRegist() {

		return "/regist/registrationStep3_Form";
	}

	/**
	 * Method : insertRegist1 작성자 : ADMIN 변경이력 :
	 * 
	 * @return Method 설명 :일반회원 정보입력
	 */
	@RequestMapping(path = "/regist3", method = RequestMethod.POST)
	@ResponseBody
	public String insertRegist1(Model model, MemberVo memberVo, RegisterVo registerVo, int[] dis_ids, MultipartFile profile,
			RedirectAttributes redirectAttributes) {
		logger.debug("!!!! 컨트롤러 도착");
		logger.debug("!!!! memberVo : {} ", memberVo);
//		logger.debug("!!!! mem_id : {} ", mem_id);

		String str = "";

		boolean passCheck = regCheck.regPass(memberVo.getMem_pass());
		if (passCheck == false) {
			str = "비밀번호를 정규식에 맞게 입력해 주세요";
			model.addAttribute("data", str);
			return "mem_pass";
		}
		boolean nameCheck = regCheck.regName(memberVo.getMem_nm());
		if (nameCheck == false) {
			str = "이름을 정규식에 맞게 입력해 주세요";
			model.addAttribute("data", str);
			return "mem_nm";
		}
		boolean phoneCheck = regCheck.regPhone(memberVo.getMem_phone());
		if (phoneCheck == false) {
			str = "핸드폰을 정규식에 맞게 입력해 주세요";
			model.addAttribute("data", str);
			return "mem_phone";
		}
		boolean mailCheck = regCheck.regMail(memberVo.getMem_mail());
		if (mailCheck == false) {
			str = "이메일을 정규식에 맞게 입력해 주세요";
			model.addAttribute("data", str);
			return "mem_mail";
		}
		
		return "success";
	}
		
	/**
	* Method : insertRegist1
	* 작성자 : ADMIN
	* 변경이력 :
	* @param model
	* @param registerVo
	* @param profile
	* @param request
	* @param dis_ids
	* @return
	* @throws ParseException
	* Method 설명 :일반회원 등록
	*/
	@RequestMapping(path = "/regist5")
	public String insertRegist1(Model model, RegisterVo registerVo, @RequestPart("profile")MultipartFile profile, HttpServletRequest request,
			int[] dis_ids) throws ParseException {

		logger.debug("!!!!!!!!!!");
		String str = "";
		
		MemberVo memberVo = new MemberVo();
		
		// 파일업로드
		
		if (profile.getSize() > 0) {
			String filename = profile.getOriginalFilename();
			String ext = PartUtil.getExt(filename);

			String uploadPath = PartUtil.getUploadPath();
			String filePath = uploadPath + File.separator + UUID.randomUUID().toString() + ext;
			memberVo.setMem_photo_path(filePath);
			memberVo.setMem_photo_nm(filename);

			try {
				profile.transferTo(new File(filePath));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}

		}

		
		memberVo.setMem_id(registerVo.getMem_id());
//		memberVo.setMem_pass(registerVo.getMem_pass());
		
		//비밀번호 암호화
		memberVo.setMem_pass(KISA_SHA256.encrypt(registerVo.getMem_pass()));
		
		memberVo.setMem_nm(registerVo.getMem_nm());
		memberVo.setMem_phone(registerVo.getMem_phone());
		memberVo.setMem_mail(registerVo.getMem_mail());
		memberVo.setMem_birth(registerVo.getMem_birth());
		memberVo.setMem_add1(registerVo.getMem_add1());
		memberVo.setMem_add2(registerVo.getMem_add2());
		memberVo.setMem_zipcd(registerVo.getMem_zipcd());
		memberVo.setPro_relation(registerVo.getPro_relation());
		memberVo.setPro_nm(registerVo.getPro_nm());
		memberVo.setPro_phone(registerVo.getPro_phone());
		memberVo.setMem_gender(registerVo.getMem_gender());
		memberVo.setMem_grade("1");
		memberVo.setMem_del("N");

		logger.debug("memberVo :{}", memberVo);
		
		int insertMemberCnt = registerService.insertMember(memberVo);
		
		//--
		
				logger.debug("profile.getName() :{}", profile.getOriginalFilename());
				logger.debug("profile.getName() :{}", profile.getName());
				logger.debug("profile.getSize() :{}", profile.getSize());
				
				// d:\\sptingUpload\2019\06\
				// d:\\sptingUpload\2019\06
				String path = PartUtil.getUploadPath();
				String ext = PartUtil.getExt(profile.getOriginalFilename());
				String fileName = UUID.randomUUID().toString();

				File uploadfile = new File(path + File.separator + fileName + ext);
				
				try {
					profile.transferTo(uploadfile);
					model.addAttribute("msg", "SUCCESS");
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
					model.addAttribute("msg", "FAIL");
				}
				
				//---
				
		

		logger.debug("insertMemberCnt :{}", insertMemberCnt);
		
		int insertMemberdieseaseCnt = 0;
		for (int i = 0; i < dis_ids.length; i++) {
			MemberDiseaseVo memberDiseaseVo= new MemberDiseaseVo(); 
			
			memberDiseaseVo.setDis_id(dis_ids[i]);
			memberDiseaseVo.setMem_dis_id(registerVo.getMem_dis_id());
			memberDiseaseVo.setMem_id(registerVo.getMem_id());
			logger.debug("!!dis_ids[i] : {}", dis_ids[i]);
			logger.debug("memberDiseaseVo :{}", memberDiseaseVo);
			
			insertMemberdieseaseCnt += registerService.insertMemberDisease(memberDiseaseVo);
			
			logger.debug("memberDiseaseVo :{}", memberDiseaseVo);
			logger.debug("insertMemberdieseaseCnt :{}", insertMemberdieseaseCnt);
		}


		if (insertMemberCnt == 1 && insertMemberdieseaseCnt == dis_ids.length) {

			logger.debug("insertMemberCnt == 1 && insertMemberdieseaseCnt == dis_ids.length :{}",
					insertMemberCnt == 1 && insertMemberdieseaseCnt == dis_ids.length);
			return "/regist/registrationStep4_Complete";
		} else {
			return "/regist/registrationStep3_Form";
		}

	}

	/**
	 * Method : registMember 작성자 : ADMIN 변경이력 :
	 * 
	 * @return Method 설명 :요양보호사 약관 동의 요청
	 */
	@RequestMapping(path = "/regist2-1", method = RequestMethod.GET)
	public String registCWMember() {

		return "/regist/registrationStep2-1_Regulation";
	}

	/**
	 * Method : registCWMember1 작성자 : ADMIN 변경이력 :
	 * 
	 * @return Method 설명 :요양보호사 약관 동의 처리
	 */
	@RequestMapping(path = "/regist2-1", method = RequestMethod.POST)
	public String registCWMember1() {

		return "/regist/registrationStep2-1_Regulation";
	}

	/**
	 * Method : registCWMember1 작성자 : ADMIN 변경이력 :
	 * 
	 * @return Method 설명 :요양보호사 정보입력 요청
	 */
	@RequestMapping(path = "/regist3-1", method = RequestMethod.GET)
	public String insertCWRegist() {

		return "/regist/registrationStep3-1_Form";
	}

	/**
	 * Method : insertCWRegist1 작성자 : ADMIN 변경이력 :
	 * 
	 * @return Method 설명 :요양보호사 정보입력 처리
	 * @throws ParseException
	 */
	@RequestMapping(path = "/regist3-1", method = RequestMethod.POST)
	@ResponseBody
	public String regCheck(Model model, HttpServletRequest request, RegisterVo registerVo) throws ParseException {


		logger.debug("!!!!!! registerVo : {}", registerVo);

		String str = "";

		boolean passCheck = regCheck.regPass(registerVo.getMem_pass());
		if (passCheck == false) {
			str = "비밀번호를 정규식에 맞게 입력해 주세요";
			model.addAttribute("data", str);
			return "mem_pass";
		}
		boolean nameCheck = regCheck.regName(registerVo.getMem_nm());
		if (nameCheck == false) {
			str = "이름을 정규식에 맞게 입력해 주세요";
			model.addAttribute("data", str);
			return "mem_nm";
		}
		boolean phoneCheck = regCheck.regPhone(registerVo.getMem_phone());
		if (phoneCheck == false) {
			str = "핸드폰을 정규식에 맞게 입력해 주세요";
			model.addAttribute("data", str);
			return "mem_phone";
		}
		boolean mailCheck = regCheck.regMail(registerVo.getMem_mail());
		if (mailCheck == false) {
			str = "이메일을 정규식에 맞게 입력해 주세요";
			model.addAttribute("data", str);
			return "mem_mail";
		}


		return "success";
	

	}
	
	
	
	/**
	* Method : insertCWRegist1
	* 작성자 : ADMIN
	* 변경이력 :
	* @param model
	* @param registerVo
	* @param profile
	* @param request
	* @param cw_days
	* @param ser_type_ids
	* @return
	* @throws ParseException
	* Method 설명 :요양보호사 등록
	*/
	@RequestMapping(path = "/regist5-1")
	public String insertCWRegist1(Model model, RegisterVo registerVo, @RequestPart("profile")MultipartFile profile, HttpServletRequest request,
			int[] cw_days, int[] ser_type_ids) throws ParseException {


		logger.debug("!!!!!! registerVo : {}", registerVo);
		logger.debug("!!!!!! profile : {}", profile);
		logger.debug("!!!!!! cw_days : {}", cw_days);
		logger.debug("!!!!!! ser_type_ids : {}", ser_type_ids);

		String str = "";

	

		MemberVo memberVo = new MemberVo();
		LocationVo locationVo = new LocationVo();

		HospitalVo hospitalVo = new HospitalVo();
		CareerVo careerVo = new CareerVo();

		
		
		if (profile.getSize() > 0) {
			
			logger.debug("☞\"profile.getSize():{}\",profile.getSize():{}");
			
			String filename = profile.getOriginalFilename();
			String ext = PartUtil.getExt(filename);

			String uploadPath = PartUtil.getUploadPath();
			String filePath = uploadPath + File.separator + UUID.randomUUID().toString() + ext;
			memberVo.setMem_photo_path(filePath);
			memberVo.setMem_photo_nm(filename);

			try {
				profile.transferTo(new File(filePath));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}

		}
		
		

		memberVo.setMem_id(registerVo.getMem_id());
//		memberVo.setMem_pass(registerVo.getMem_pass());
		
		//비밀번호 암호화
		memberVo.setMem_pass(KISA_SHA256.encrypt(registerVo.getMem_pass()));
		
		memberVo.setMem_nm(registerVo.getMem_nm());
		memberVo.setMem_phone(registerVo.getMem_phone());
		memberVo.setMem_mail(registerVo.getMem_mail());
		memberVo.setMem_birth(registerVo.getMem_birth());
		memberVo.setCw_lic(registerVo.getCw_lic());
		memberVo.setCw_driver(registerVo.getCw_driver());
		memberVo.setMem_gender(registerVo.getMem_gender());
		memberVo.setMem_grade("3");
		memberVo.setMem_del("N");
		memberVo.setMem_add1(registerVo.getMem_add1());
		memberVo.setMem_add2(registerVo.getMem_add2());
		memberVo.setMem_zipcd(registerVo.getMem_zipcd());

		logger.debug("memberVo :{}", memberVo);

		int insertCWMemberCnt = registerService.insertCWMember(memberVo);
		
		
		//--
		
		logger.debug("profile.getName() :{}", profile.getOriginalFilename());
		logger.debug("profile.getName() :{}", profile.getName());
		logger.debug("profile.getSize() :{}", profile.getSize());
		
		// d:\\sptingUpload\2019\06\
		// d:\\sptingUpload\2019\06
		String path = PartUtil.getUploadPath();
		String ext = PartUtil.getExt(profile.getOriginalFilename());
		String fileName = UUID.randomUUID().toString();

		File uploadfile = new File(path + File.separator + fileName + ext);
		
		try {
			profile.transferTo(uploadfile);
			model.addAttribute("msg", "SUCCESS");
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			model.addAttribute("msg", "FAIL");
		}
		
		//---
		
		

		logger.debug("insertCWMemberCnt :{}", insertCWMemberCnt);

		locationVo.setLoc_dong(registerVo.getLoc_dong());
		locationVo.setLoc_id(registerVo.getLoc_id());
		locationVo.setMem_id(registerVo.getMem_id());

		logger.debug("locationVo :{}", locationVo);

		int insertLocationCnt = registerService.insertLocation(locationVo);

		logger.debug("insertLocationCnt : {}", insertLocationCnt);

		int insertDayCnt = 0;
		for (int i = 0; i < cw_days.length; i++) {
			DayVo dayVo = new DayVo();
			logger.debug("!!cw_days[i] : {}", cw_days[i]);
			dayVo.setCw_day(cw_days[i]);
			dayVo.setMem_id(registerVo.getMem_id());
			insertDayCnt += registerService.insertDay(dayVo);
		}

		logger.debug("cnt:{}", insertDayCnt);

		int insertCWServiceCnt = 0;
		for (int i = 0; i < ser_type_ids.length; i++) {
			CwServiceTypeVo cwServiceTypeVo = new CwServiceTypeVo();
			cwServiceTypeVo.setSer_type_id(ser_type_ids[i]);
			cwServiceTypeVo.setMem_id(registerVo.getMem_id());
			cwServiceTypeVo.setCw_ser_type_id(registerVo.getCw_ser_type_id());

			insertCWServiceCnt += registerService.insertCWServiceType(cwServiceTypeVo);
		}

		logger.debug("insertCWServiceCnt:{}", insertCWServiceCnt);

//		hospitalVo.setHos_nm(registerVo.getHos_nm());
//		hospitalVo.setHos_phone(registerVo.getHos_phone());
//		hospitalVo.setHos_add(registerVo.getHos_add());
//
//		logger.debug("hospitalVo :{}", hospitalVo);
//
//		int insertHopitalCnt = registerService.insertHospital(hospitalVo);
//
//		logger.debug("insertHopitalCnt :{}", insertHopitalCnt);

//		careerVo.setCareer_st_dt(registerVo.getCareer_st_dt());
//		careerVo.setCareer_end_dt(registerVo.getCareer_end_dt());
		careerVo.setCareer_st_dt(registerVo.getCareer_st_dt());
		careerVo.setCareer_end_dt(registerVo.getCareer_end_dt());
		careerVo.setCareer_cont(registerVo.getCareer_cont());
		careerVo.setCw_career_id(registerVo.getCw_career_id());
		careerVo.setMem_id(registerVo.getMem_id());
		careerVo.setCareer_hos(registerVo.getHos_nm());

		logger.debug("careerVo:{}", careerVo);

		int insertCareerCnt = registerService.insertCareer(careerVo);

		logger.debug("insertCareerCnt:{}", insertCareerCnt);

		if (insertCWMemberCnt == 1 && insertLocationCnt == 1 && insertDayCnt == cw_days.length
				&& insertCWServiceCnt == ser_type_ids.length && insertCareerCnt == 1) {
			return "/regist/registrationStep4_Complete";
		} else {
			return "/regist/registrationStep3-1_Form";
		}

	}
	
	
	
	
	
	

	@RequestMapping("/profile")
	public String profile(MemberVo memberVo, Model model) throws IOException {

		// 사용자 정보(path)를 조회
		memberVo = registerService.getMemVo(memberVo.getMem_id());

		/*
		 * // path정보로 file을 읽어 들여서 ServletOutputStream sos = response.getOutputStream();
		 * 
		 * FileInputStream fis = null; String filePath = null;
		 * 
		 * // 사용자가 업로드한 파일이 존재할 경우 : path if (userVo.getPath() != null) filePath =
		 * userVo.getPath();
		 * 
		 * // 사용자가 업로드한 파일이 존재하지 않을 경우 : no_image.gif else // webapp--> img-->
		 * no-_mage.gif filePath =
		 * request.getServletContext().getRealPath("/img/no_image.gif");
		 * 
		 * File file = new File(filePath); fis = new FileInputStream(file); byte[]
		 * buffer = new byte[512];
		 * 
		 * // response객체에 스트림으로 써준다 while (fis.read(buffer, 0, 512) != -1) {
		 * sos.write(buffer); }
		 * 
		 * fis.close(); sos.close(); }
		 */

		model.addAttribute("memberVo", memberVo);

		return "ProfileView";

	}

	/**
	 * Method : registComplete 작성자 : ADMIN 변경이력 :
	 * 
	 * @return Method 설명 : 회원가입 입력 성공 요청
	 */
	@RequestMapping(path = "/regist4", method = RequestMethod.GET)
	public String registComplete() {

		return "/regist/registrationStep4_Complete";
	}

	/**
	 * Method : registComplete1 작성자 : ADMIN 변경이력 :
	 * 
	 * @return Method 설명 :회원가입 입력 성공 처리
	 */
	@RequestMapping(path = "/regist4", method = RequestMethod.POST)
	public String registComplete1() {

		return "/regist/registrationStep4_Complete";
	}
	

	
	
	//--------캡챠API
	
	String clientId = "GB9eZji0PcnGGgnOudgC";//애플리케이션 클라이언트 아이디값";
	String clientSecret = "WkkkB0cPtY";//애플리케이션 클라이언트 시크릿값";
	@RequestMapping(path = "/captchaNkey")
	public String CaptchaNkey(Model model) {
		logger.debug("!!!!!!! ajax 넘어 오는가 ");
		String result="";
		try {
			String code = "0"; // 키 발급시 0,  캡차 이미지 비교시 1로 세팅
			String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code;
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if(responseCode==200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {  // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			logger.debug("!!!!!!! : {}",response.toString());
			result = response.toString().substring(8, 8 + 16);
//			result = response.toString();
		} catch (Exception e) {
			System.out.println(e);
		}
		model.addAttribute("key",result);
		return "jsonView";
	}
	
	
	@RequestMapping(path = "/captchaImage", method = RequestMethod.GET)
	public String CaptchaImage(Model model,String key,HttpServletRequest request ){
		logger.debug("!!!!!CaptchaImage222");
        String result = null;
        String dirPath = (String) request.getServletContext().getRealPath("/captchaImage");
        logger.debug("!!!!!dirPath : {}" , dirPath);
        
        try {
            String apiURL = "https://openapi.naver.com/v1/captcha/ncaptcha.bin?key=" + key;
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                InputStream is = con.getInputStream();
                int read = 0;
                byte[] bytes = new byte[1024];
                // 랜덤한 이름으로  파일 생성
                String tempname = Long.valueOf(new Date().getTime()).toString();
                File f = new File(dirPath +File.separator+""+tempname + ".jpg");
                f.createNewFile();
                OutputStream outputStream = new FileOutputStream(f);
                
				while ((read = is.read(bytes)) != -1) {
					outputStream.write(bytes, 0, read);
				}
				result = tempname + ".jpg";
//				result = f.getAbsolutePath();
				outputStream.close();
				is.close();
  
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
                String inputLine;
                StringBuffer response = new StringBuffer();
                while ((inputLine = br.readLine()) != null) {
                    response.append(inputLine);
                }
                br.close();
                System.out.println(response.toString());
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        
        model.addAttribute("captchaImageName",result);
        return "jsonView";
		
	}
	
	@RequestMapping(path = "/captchaNkeyResult" )
	public String CaptchaNkeyResult(Model model,String key, String value) {
        try {
            String code = "1"; // 키 발급시 0,  캡차 이미지 비교시 1로 세팅
            String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code +"&key="+ key + "&value="+ value;
            int result =0;
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
                result=1;
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            System.out.println(response.toString());
            model.addAttribute("result",result);
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return "jsonView";
		
	}
	
	
	

}
