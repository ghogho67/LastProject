package kr.or.ddit.category.category.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.member.member.model.MemberVo;

@RequestMapping("/re")
@Controller
public class RedirectController {
	@RequestMapping("/cate")
	private String Cate(int cate_id, RedirectAttributes ra, HttpSession session ) {
		MemberVo memberVo = (MemberVo) session.getAttribute("MEM_INFO");
		if(cate_id==30001) {
			//회사소개
			return"";
			
		}else if(cate_id==30002) {
			ra.addAttribute("cate_id", cate_id);
			//마이페이지
			if(memberVo.getMem_grade().equals("0")) {
				return"redirect:/mypage/Admin_Info";
			}else if(memberVo.getMem_grade().equals("1")) {
				return"redirect:/mypage/Patient_Info";
			}else if(memberVo.getMem_grade().equals("2")) {
				return"redirect:/mypage/Patient_Info";
			}else if(memberVo.getMem_grade().equals("3")) {
				return"redirect:/mypage/Worker_Info";
			} 
			
		}else if(cate_id==30003) {
			
		}else if(cate_id==30004) {
			
		}else if(cate_id==30005) {
			
		}else if(cate_id==30006) {
			
		}else if(cate_id==30007) {
			
		}else if(cate_id==30008) {
			ra.addAttribute("cate_id", cate_id);
			return"redirect:/matching/map";
			
			
		}else if(cate_id==30009) {
			ra.addAttribute("cate_id", cate_id);
			return"redirect:/hospital/pagingList?page=1&pageSize=10";
			
		}else if(cate_id==30010) {
			ra.addAttribute("cate_id", cate_id);
			return"redirect:/nursingHome/pagingList?page=1&pageSize=10";
			
		}else if(cate_id==30011) {
			return"redirect:/post/pagingList?searchType=a&cate_id=30011";
			
		}else if(cate_id==30012) {
			return"redirect:/post/pagingList?searchType=a&cate_id=30012";
			
		}else if(cate_id==30013) {
			return"redirect:/post/pagingList?searchType=a&cate_id=30013";
			
		}else if(cate_id==30014) {
			ra.addAttribute("cate_id", cate_id);
			return"redirect:/recognitionImp/impStart";
			
			
		}else if(cate_id==30015) {
			ra.addAttribute("cate_id", cate_id);
			return"redirect:/recognition/semiTestStart";
			
		}else if(cate_id==30016) {
			ra.addAttribute("cate_id", cate_id);
			return"redirect:/mypage/stress?mem_id="+memberVo.getMem_id();
			
		}else if(cate_id==30017) {
			
		}else if(cate_id==30018) {
			ra.addAttribute("cate_id", cate_id);
			return"redirect:/mypage/gpxMap?mem_id="+memberVo.getMem_id();
			
		}else if(cate_id==30019) {
			ra.addAttribute("cate_id", cate_id);
			return"redirect:/shelter/pagingList?page=1&pageSize=10";
			
		}else if(cate_id==30020) {
			ra.addAttribute("cate_id", cate_id);
			return"redirect:/lecture/lectureMain";
			
		}else if(cate_id==30021) {
			ra.addAttribute("cate_id", cate_id);
			return"redirect:/post/ImageBoard2";
			
		}
		return null;
		
	}

}
