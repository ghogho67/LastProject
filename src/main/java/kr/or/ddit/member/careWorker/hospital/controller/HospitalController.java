package kr.or.ddit.member.careWorker.hospital.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.member.careWorker.hospital.model.HospitalVo;
import kr.or.ddit.member.careWorker.hospital.service.IHospitalService;
import kr.or.ddit.page.model.PageVo;

@RequestMapping("/hospital")
@Controller
public class HospitalController {
	
	private static final Logger logger = LoggerFactory.getLogger(HospitalController.class);
	
	@Resource(name = "hospitalService")
	private IHospitalService hospitalService;
	

	/**
	* Method : hospital
	* 작성자 : ADMIN
	* 변경이력 :
	* @param model
	* @param pageVo
	* @return
	* Method 설명 : 병원 페이징 리스트
	*/
	@RequestMapping(path = "/pagingList", method = RequestMethod.GET)
	public String hospital(Model model, PageVo pageVo) {
		
		Map<String, Object> resultMap = hospitalService.hosPagingList(pageVo);

		logger.debug("☞resultMap:{}", resultMap);
		
		List<HospitalVo> hosList = (List<HospitalVo>) resultMap.get("hosList");
		int paginationSize = (Integer) resultMap.get("paginationSize");
		
		logger.debug("☞hosList:{}",hosList);
		
		model.addAttribute("hosList", hosList);
		model.addAttribute("paginationSize", paginationSize);
		model.addAttribute("pageVo", pageVo);
		
		logger.debug("☞hosList:{}",hosList);
		logger.debug("☞paginationSize:{}",paginationSize);
		logger.debug("☞pageVo:{}",pageVo);
		
		return "/hospital/hospitalPagingList.tiles";
	}
	
	
	/**
	* Method : searchHospital
	* 작성자 : ADMIN
	* 변경이력 :
	* @return
	* Method 설명 : 병원 검색 요청
	*/
	@RequestMapping(path = "/searchPagingList", method = RequestMethod.GET)
	public String searchHospital(Model model, String hos_add) {
		
		model.addAttribute("getSearchHosAdd", hospitalService.getSearchHosAdd(hos_add));

		
		return "/hospital/searchHospital.tiles";
	}
	
	
	/**
	* Method : searchHospital1
	* 작성자 : ADMIN
	* 변경이력 :
	* @return
	* Method 설명 :병원 검색 처리
	*/
	@RequestMapping(path = "/searchPagingList", method = RequestMethod.POST)
	public String searchHospital1(Model model, String hos_add, HospitalVo hospitalVo, PageVo pageVo) {
		
		logger.debug("☞searchHospital");
		logger.debug("☞hos_add:{}",hos_add);

		
		List<HospitalVo> getSearchHosAdd = hospitalService.getSearchHosAdd(hos_add);
		
		model.addAttribute("getSearchHosAdd", getSearchHosAdd);
		
		logger.debug("☞getSearchHosAdd:{}",getSearchHosAdd);
		
		
		
		//-------------- 페이지 네이션!!
		
//		Map<String, Object> map = new HashMap<String, Object>();
//		hospitalVo = new HospitalVo(hos_add);
//		
//		map.put("getSearchHosAdd", hospitalService.getSearchHosAdd(hos_add));
//		map.put("hos_add", hospitalVo.getHos_add());
//		map.put("page", pageVo.getPage());
//		map.put("pageSize", pageVo.getPageSize());
//		
//		logger.debug("☞hos_add:{}",hospitalService.getSearchHosAdd(hos_add));
//		logger.debug("☞page:{}",pageVo.getPage());
//		logger.debug("☞pageSize:{}",pageVo.getPageSize());
//		
//		Map<String, Object> resultMap = hospitalService.searchHosPagingList(map);
//		List<HospitalVo> getSearchHosAdd = (List<HospitalVo>) resultMap.get("getSearchHosAdd");
//		int paginationSize = (Integer) resultMap.get("paginationSize");
//		
//		logger.debug("☞resultMap:{}", resultMap);
//		
//		model.addAttribute("getSearchHosAdd", getSearchHosAdd);
//		model.addAttribute("paginationSize", paginationSize);
//		model.addAttribute("pageVo", pageVo);
//		model.addAttribute("hos_add", hos_add);
		
		
		//-- 네이버 map API적용
		
		List<String> list = new ArrayList<String>();
		
		List<HospitalVo> hosList = hospitalService.hosList();
		model.addAttribute("hosList",hosList);
		
		List<String> searchMapList = hospitalService.searchMapList(hos_add);
		model.addAttribute("searchMapList",searchMapList);
		logger.debug("☞searchMapList:{}",searchMapList);
		
		for(int i = 0; i < hosList.size(); i++) {
			list.add(hosList.get(i).getHos_nm()+ ":" + hosList.get(i).getHos_phone() + ": " + hosList.get(i).getHos_add());
		}
		logger.debug("☞list:{}",list);
		model.addAttribute("list", list);
				
		
		return "/hospital/searchHospital.tiles";
	}
	
	@RequestMapping(path = "/map")
	public String searchMapList(String hos_add, Model model) {

		return "/hospital/maps";
	}


	


}
