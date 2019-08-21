package kr.or.ddit.category.others.nursingHome.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.category.category.model.CategoryVo;
import kr.or.ddit.category.category.service.ICategoryService;
import kr.or.ddit.category.others.nursingHome.model.NursingHomeVo;
import kr.or.ddit.category.others.nursingHome.service.INursingHomeService;
import kr.or.ddit.page.model.PageVo;

@RequestMapping("/nursingHome")
@Controller
public class NursingHomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NursingHomeController.class);
	
	@Resource(name = "nursingHomeService")
	private INursingHomeService nursingHomeService;
	
	@Resource(name = "categoryService")
	ICategoryService categoryService;
	
	/**
	* Method : nursingHome
	* 작성자 : ADMIN
	* 변경이력 :
	* @param model
	* @param pageVo
	* @return
	* Method 설명 : 요양시설 페이지 네이션
	*/
	@RequestMapping(path = "/pagingList", method = RequestMethod.GET)
	public String nursingHome(HttpSession session, int cate_id,Model model, PageVo pageVo, int page, int pageSize) {
		
		pageVo = new PageVo();
		pageVo.setPage(page);
		pageVo.setPageSize(pageSize);
		
		Map<String, Object> resultMap = nursingHomeService.nursingPagingList(pageVo);
		logger.debug("☞resultMap:{}",resultMap);
		
		List<NursingHomeVo> nursingList = (List<NursingHomeVo>) resultMap.get("nursingList");

		int startPage = ((int)Math.floor((pageVo.getPage()-1)/10)) + 1;
        if(pageVo.getPage()==1) {
        	startPage =1;
        }
        if(startPage>=2) {
        	startPage =((int)Math.floor((pageVo.getPage()-1)/10)*10) + 1;
        }
        int paginationSize = ((int)Math.floor((pageVo.getPage()-1)/10 + 1))*10;
        
        int lastpaginationSize= (int) resultMap.get("lastpaginationSize");
        
        if(((int)Math.floor((pageVo.getPage()-1)/10 + 1))*10>lastpaginationSize) {
        	paginationSize= lastpaginationSize;
        }
		
		
		logger.debug("☞nursingList:{}",nursingList);
		
		model.addAttribute("nursingList", nursingList);
		model.addAttribute("startPage", startPage);
		model.addAttribute("paginationSize", paginationSize);
		model.addAttribute("lastpaginationSize", lastpaginationSize);
		model.addAttribute("pageVo", pageVo);
		
		logger.debug("☞nursingList:{}",nursingList);
		logger.debug("☞paginationSize:{}",paginationSize);
		logger.debug("☞pageVo:{}",pageVo);
		
		//사이드바 처리
		List<CategoryVo> categoryList = categoryService.sideBarList(cate_id);
		logger.debug("!!!!!!!!cate_id : {}",cate_id);
		logger.debug("!!!!!!!!categoryList : {}",categoryList);
		session.setAttribute("sideBar",categoryList);
		
		return "/nursingHome/nursingHomePagingList.tiles";
	}
	
	/**
	* Method : searchNursingHome
	* 작성자 : ADMIN
	* 변경이력 :
	* @param model
	* @param pageVo
	* @param nh_add
	* @return
	* Method 설명 : 요양시설 지역검색
	*/
	@RequestMapping(path = "/searchNursing", method = RequestMethod.POST)
	public String searchNursingHome(Model model, PageVo pageVo, String nh_add) {
		
		List<NursingHomeVo> searchNursingHome = nursingHomeService.searchNursingHome(nh_add);
		logger.debug("☞searchNursingHome:{}",searchNursingHome);
		
		model.addAttribute("searchNursingHome",searchNursingHome);
		logger.debug("☞searchNursingHome:{}",searchNursingHome);
		
		return "/nursingHome/searchNursingHome.tiles";
	}
	
	/**
	* Method : detailNursingHome
	* 작성자 : ADMIN
	* 변경이력 :
	* @param model
	* @param nh_id
	* @return
	* Method 설명 :요양시설 상세보기
	*/
	@RequestMapping(path = "/detailNursing", method = RequestMethod.GET)
	public String detailNursingHome(Model model, int nh_id) {
		
		logger.debug("☞nh_id:{}",nh_id);
		
		model.addAttribute("nursingHomeVo", nursingHomeService.getNursingHome(nh_id));
		logger.debug("☞nursingHomeVo:{}",nursingHomeService.getNursingHome(nh_id));
		
		return "/nursingHome/detailNursingHome.tiles";
	}
	

}
