package kr.or.ddit.category.others.shelter.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.category.others.shelter.model.ShelterVo;
import kr.or.ddit.category.others.shelter.service.IShelterService;
import kr.or.ddit.page.model.PageVo;
@RequestMapping("/shelter")
@Controller
public class ShelterController {
	
	private static final Logger logger = LoggerFactory.getLogger(ShelterController.class);
	
	@Resource(name = "shelterService")
	private IShelterService shelterService;
	
	@RequestMapping(path = "/pagingList", method = RequestMethod.GET)
	public String shelter(Model model, PageVo pageVo) {
		
		Map<String, Object> resultMap = shelterService.shelterPagingList(pageVo);
		
		logger.debug("☞resultMap:{}", resultMap);
		
		List<ShelterVo> shelterList = (List<ShelterVo>) resultMap.get("shelterList");
		int paginationSize = (Integer) resultMap.get("paginationSize");
		
		logger.debug("☞shelterList:{}",shelterList);
		
		model.addAttribute("shelterList", shelterList);
		model.addAttribute("paginationSize", paginationSize);
		model.addAttribute("pageVo", pageVo);
		
		logger.debug("☞shelterList:{}",shelterList);
		logger.debug("☞paginationSize:{}",paginationSize);
		logger.debug("☞pageVo:{}",pageVo);
		
		return "/shelter/shelterPagingList.tiles";
	}
	
	@RequestMapping(path = "/searchShelter", method = RequestMethod.GET)
	public String searchShelter(Model model, String sh_add) {
		
		model.addAttribute("getAddShelterList", shelterService.getAddShelterList(sh_add));
		
		return "/shelter/hselter";
	}
	

	
	
	
	
	

}
