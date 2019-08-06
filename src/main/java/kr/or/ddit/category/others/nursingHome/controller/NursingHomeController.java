package kr.or.ddit.category.others.nursingHome.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.category.others.nursingHome.model.NursingHomeVo;
import kr.or.ddit.category.others.nursingHome.service.INursingHomeService;
import kr.or.ddit.page.model.PageVo;

@RequestMapping("/nursingHome")
@Controller
public class NursingHomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NursingHomeController.class);
	
	@Resource(name = "nursingHomeService")
	private INursingHomeService nursingHomeService;
	
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
	public String nursingHome(Model model, PageVo pageVo) {
		
		Map<String, Object> resultMap = nursingHomeService.nursingPagingList(pageVo);
		logger.debug("☞resultMap:{}",resultMap);
		
		List<NursingHomeVo> nursingList = (List<NursingHomeVo>) resultMap.get("nursingList");
		int paginationSize = (Integer) resultMap.get("paginationSize");
		
		logger.debug("☞nursingList:{}",nursingList);
		
		model.addAttribute("nursingList", nursingList);
		model.addAttribute("paginationSize", paginationSize);
		model.addAttribute("pageVo", pageVo);
		
		logger.debug("☞nursingList:{}",nursingList);
		logger.debug("☞paginationSize:{}",paginationSize);
		logger.debug("☞pageVo:{}",pageVo);
		
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
		
		model.addAttribute("nursingHomeVo", nursingHomeService.getNursingHome(nh_id));
		
		return "/nursingHome/detailNursingHome.tiles";
	}
	

}
