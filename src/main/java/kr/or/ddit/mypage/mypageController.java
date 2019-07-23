package kr.or.ddit.mypage;


import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.util.PartUtil;

@RequestMapping("/mypage")
@Controller
public class mypageController {
	private static final Logger logger = LoggerFactory.getLogger(mypageController.class);
	
	
	

	@RequestMapping("/Patient_Info")
	public String Patient_Info() {
		return "mypage/Patient_Info";
	}
	
	
	
	
	@RequestMapping("/Patient_InfoModification")
	public String Patient_InfoModification() {
		return "mypage/Patient_InfoModification";
	}
	
	
	
	@RequestMapping("/Worker_Info")
	public String Worker_Info() {
		return "mypage/Worker_Info";
	}
	
	
	
	
	@RequestMapping(path ="/Worker_InfoModification", method = RequestMethod.GET)
	public String Worker_InfoModification() {
		return "mypage/Worker_InfoModification";
	}
	
	
	@RequestMapping(path ="/Worker_InfoModification" , method = RequestMethod.POST) 
	public String Worker_InfoModification(MemberVo memVo, Model model ,MultipartFile profile, HttpSession session,
			@RequestParam(name = "posttitle") String posttitle,
			@RequestParam(name = "postcontent") String postcontent,
			@RequestParam(name = "boardid") String boardid,
			@RequestParam(name = "postId") String postid) {
	
	
		
		
		String memgrade = (String) session.getAttribute("USERID");

		
		
		
		
		if (profile.getSize() > 0) {
			String fileName = profile.getOriginalFilename();
			String ext = PartUtil.getExt(fileName);
			String uploadPath = PartUtil.getUploadPath();
			
			String filePath = uploadPath + File.separator + UUID.randomUUID().toString() + ext;
			memVo.setMem_photo_path(filePath);
			memVo.setMem_photo_nm(fileName);
			
			logger.debug("fileName : {} ",fileName);
			logger.debug("filePath : {} ",filePath);
			

			try {
				profile.transferTo(new File(filePath));
				model.addAttribute("msg", "SUCCESS");
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		
		
		
		
		
		
		
		return "mypage/Worker_InfoModification";
	}
	
	
	@RequestMapping("/Admin_Info")
	public String Admin_Info() {
		return "mypage/Admin_Info";
	}
	
	


}
