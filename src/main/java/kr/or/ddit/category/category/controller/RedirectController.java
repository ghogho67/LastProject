package kr.or.ddit.category.category.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.category.category.model.CategoryVo;
import kr.or.ddit.category.category.service.ICategoryService;
import kr.or.ddit.member.member.model.MemberVo;

@RequestMapping("/re")
@Controller
public class RedirectController {
	@Resource(name = "categoryService")
	ICategoryService categoryService;
	
	
	@RequestMapping("/cate")
	private String Cate(int cate_id, RedirectAttributes ra, HttpSession session ) {
		MemberVo memberVo = (MemberVo) session.getAttribute("MEM_INFO");
		if(cate_id==30001) {
			//회사소개
			return"";
			
		}else if(cate_id==30002) {
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
			//사이드바 처리
			List<CategoryVo> categoryList = categoryService.sideBarList(cate_id);
			
			session.setAttribute("sideBar",categoryList);
			return"redirect:/matching/map";
			
			
		}else if(cate_id==30009) {
			//사이드바 처리
			List<CategoryVo> categoryList = categoryService.sideBarList(cate_id);
			session.setAttribute("sideBar",categoryList);
			
			return"redirect:/hospital/pagingList?page=1&pageSize=10";
			
		}else if(cate_id==30010) {
			//사이드바 처리
			List<CategoryVo> categoryList = categoryService.sideBarList(cate_id);
			session.setAttribute("sideBar",categoryList);
			return"redirect:/nursingHome/pagingList?page=1&pageSize=10";
			
		}else if(cate_id==30011) {
			//사이드바 처리
			List<CategoryVo> categoryList = categoryService.sideBarList(cate_id);
			session.setAttribute("sideBar",categoryList);
			return"redirect:/post/pagingList?searchType=a&cate_id=30011";
			
		}else if(cate_id==30012) {
			//사이드바 처리
			List<CategoryVo> categoryList = categoryService.sideBarList(cate_id);
			session.setAttribute("sideBar",categoryList);
			return"redirect:/post/pagingList?searchType=a&cate_id=30012";
			
		}else if(cate_id==30013) {
			//사이드바 처리
			List<CategoryVo> categoryList = categoryService.sideBarList(cate_id);
			session.setAttribute("sideBar",categoryList);
			return"redirect:/post/pagingList?searchType=a&cate_id=30013";
			
		}else if(cate_id==30014) {
			//사이드바 처리
			List<CategoryVo> categoryList = categoryService.sideBarList(cate_id);
			session.setAttribute("sideBar",categoryList);
			return"redirect:/recognitionImp/impStart";
			
			
		}else if(cate_id==30015) {
			//사이드바 처리
			List<CategoryVo> categoryList = categoryService.sideBarList(cate_id);
			session.setAttribute("sideBar",categoryList);;
			return"redirect:/recognition/semiTestStart";
			
		}else if(cate_id==30016) {
			//사이드바 처리
			List<CategoryVo> categoryList = categoryService.sideBarList(cate_id);
			session.setAttribute("sideBar",categoryList);
			return"redirect:/mypage/stress?mem_id="+memberVo.getMem_id();
			
		}else if(cate_id==30017) {
			
		}else if(cate_id==30018) {
			//사이드바 처리
			List<CategoryVo> categoryList = categoryService.sideBarList(cate_id);
			session.setAttribute("sideBar",categoryList);
			return"redirect:/mypage/gpxMap?mem_id="+memberVo.getMem_id();
			
		}else if(cate_id==30019) {
			//사이드바 처리
			List<CategoryVo> categoryList = categoryService.sideBarList(cate_id);
			session.setAttribute("sideBar",categoryList);
			return"redirect:/shelter/pagingList?page=1&pageSize=10";
			
		}else if(cate_id==30020) {
			//사이드바 처리
			List<CategoryVo> categoryList = categoryService.sideBarList(cate_id);
			session.setAttribute("sideBar",categoryList);
			return"redirect:/lecture/lectureMain";
			
		}else if(cate_id==30021) {
			//사이드바 처리
			List<CategoryVo> categoryList = categoryService.sideBarList(cate_id);
			session.setAttribute("sideBar",categoryList);
			return"redirect:/post/ImageBoard2";
			
		}
		return null;
		
	}

}
