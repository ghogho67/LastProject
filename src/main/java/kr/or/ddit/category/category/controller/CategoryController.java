package kr.or.ddit.category.category.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.category.category.model.CategoryVo;
import kr.or.ddit.category.category.service.ICategoryService;

@RequestMapping("/category")
@Controller
public class CategoryController {
	
	
	@Resource(name = "categoryService")
	private ICategoryService categoryService;
	
	
	
	
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(CategoryController.class);
	
	@RequestMapping(path = "/categoryList", method = RequestMethod.GET)
	public String categoryList(Model model, HttpSession session) {
		
		
		List<CategoryVo> CategoryList = categoryService.getMajorCategoryList();
		logger.debug("@@@@CategoryList : {} ", CategoryList);

		model.addAttribute("CategoryList", CategoryList);
		
		
		return "category/categoryList_Major";
	}

	
	
	
	@RequestMapping(path = "/categoryDelete", method = RequestMethod.GET)
	public String categoryDelete(Model model, HttpSession session,RedirectAttributes redirectAttributes,
			@RequestParam(name = "cate_id")int cate_id) {
		
		
		logger.debug("@@@@cate_id{}",cate_id);
		
		String viewName =null;
		 int updateCnt = categoryService.deleteMajorCategory(cate_id);
		
		 if(updateCnt>=1) {
			 viewName="redirect:/category/categoryList";
		 }else {
			 viewName="redirect:/login";
		 }
		 
			return viewName;
		
	}


	
	
	@RequestMapping(path = "/categoryMinorDelete", method = RequestMethod.GET)
	public String categoryMinorDelete(Model model, HttpSession session,RedirectAttributes redirectAttributes,
			@RequestParam(name = "cate_id")int cate_id,
		@RequestParam(name = "cate_paerent_id")int cate_paerent_id) {
		
		
		logger.debug("@@@@cate_id{}",cate_id);
		
		String viewName =null;
		 int updateCnt = categoryService.deleteMajorCategory(cate_id);
		
		 if(updateCnt==1) {
			 viewName="redirect:/category/categoryManagement?cate_id="+cate_paerent_id;
		 }else {
			 viewName="redirect:/login";
		 }
		 
			return viewName;
		
	}
	
	
	@RequestMapping(path = "/categoryUse", method = RequestMethod.GET)
	public String categoryUse(Model model, HttpSession session,RedirectAttributes redirectAttributes,
			@RequestParam(name = "cate_id")int cate_id) {
		
		
		logger.debug("@@@@cate_id{}",cate_id);
		
		String viewName =null;
		 int updateCnt = categoryService.useMajorCategory(cate_id);
		
		 if(updateCnt==1) {
			 viewName="redirect:/category/categoryList";
		 }else {
			 viewName="redirect:/login";
		 }
		 
			return viewName;
		
	}
	@RequestMapping(path = "/categoryMinorUse", method = RequestMethod.GET)
	public String MinorcategoryUse(Model model, HttpSession session,RedirectAttributes redirectAttributes,
			@RequestParam(name = "cate_id")int cate_id,
			@RequestParam(name = "cate_paerent_id")int cate_paerent_id)  {
		
		
		logger.debug("@@@@cate_id{}",cate_id);
		
		String viewName =null;
		int updateCnt = categoryService.useMajorCategory(cate_id);
		
		if(updateCnt==1) {
			 viewName="redirect:/category/categoryManagement?cate_id="+cate_paerent_id;
		}else {
			viewName="redirect:/login";
		}
		
		return viewName;
		
	}
	

	
	
	
	//중분류 카테고리 리스트를 출력한다 
	@RequestMapping(path = "/categoryManagement", method = RequestMethod.GET)
	public String categoryMinorList(Model model, HttpSession session,RedirectAttributes redirectAttributes,
			@RequestParam(name = "cate_id")int cate_paerent_id) {
		
		
		List<CategoryVo> MinorCategoryList = categoryService.getMinorCategoryList(cate_paerent_id);
		logger.debug("@@@@CategoryList : {} ", MinorCategoryList);

		model.addAttribute("MinorCategoryList", MinorCategoryList);
		
		
		return "category/categoryList_Minor";
	}

	
	
	

	
	
	@RequestMapping(path = "/updateCategoryTitle", method = RequestMethod.POST)
	public String updateCategoryTitle(Model model, HttpSession session,RedirectAttributes redirectAttributes,
			@RequestParam(name = "cate_id")int cate_id,
			@RequestParam(name = "CateTitle")String cate_title) {
		
		logger.debug("@@@@CategoryId{}",cate_id);
		logger.debug("@@@@CateTitle{}",cate_title);
		
		CategoryVo categoryVo= new CategoryVo(cate_id, cate_title);
		
		
		
		String viewName =null;
		
		int updateTitle = categoryService.updateCategoryTitle(categoryVo);
		
		if(updateTitle==1) {
			 viewName="redirect:/category/categoryManagement";
		}else {
			viewName="redirect:/login";
		}
		
		return viewName;
		
	}

	
	
	
	
	@RequestMapping(path = "/updateCategoryTitle2", method = RequestMethod.POST)
	public String updateCategoryTitle2(Model model, HttpSession session,RedirectAttributes redirectAttributes,
			@RequestParam(name = "cate_id")int cate_id,
			@RequestParam(name = "cate_paerent_id")int cate_paerent_id,
			@RequestParam(name = "CateTitle")String cate_title) {
		
		
		
		logger.debug("@@@@CategoryId{}",cate_id);
		logger.debug("@@@@CateTitle{}",cate_title);
		logger.debug("@@@@cate_paerent_id{}",cate_paerent_id);
		
		
		CategoryVo categoryVo= new CategoryVo(cate_id, cate_title);
		
		
		
		String viewName =null;
		
		int updateTitle = categoryService.updateCategoryTitle(categoryVo);
		
		if(updateTitle==1) {
			 viewName="redirect:/category/categoryManagement?cate_id="+cate_paerent_id;
		}else {
			viewName="redirect:/login";
		}
		
		return viewName;
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	
//	@RequestMapping(path = "/categoryInsert", method = RequestMethod.GET)
//	public String categoryInsert(Model model, HttpSession session,RedirectAttributes redirectAttributes,
//			@RequestParam(name = "cate_id")int cate_paerent_id) {
//	
//		model.addAttribute("cate_paerent_id", cate_paerent_id);
//		
//		
//		return "category/categoryInsert";
//	}
//	
	
	
	
	
	
	

	@RequestMapping(path = "/categoryInsert", method = RequestMethod.POST)
	public String categoryInsert(Model model, HttpSession session,RedirectAttributes redirectAttributes,
			@RequestParam(name = "cate_title")int cate_title,
			@RequestParam(name = "cate_paerent_id")int cate_paerent_id) {

		
		
		
		
		model.addAttribute("cate_paerent_id", cate_paerent_id);
		return "category/categoryInsert";
	}
	
	
	
	
	
	
	
	
}
