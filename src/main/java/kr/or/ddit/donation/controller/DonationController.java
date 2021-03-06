package kr.or.ddit.donation.controller;

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

import kr.or.ddit.approval.model.ApprovalVo;
import kr.or.ddit.approval.service.IApprovalService;
import kr.or.ddit.donation.model.DonationVo;
import kr.or.ddit.donation.service.IDonationService;
import kr.or.ddit.joinVo.DonationApprovalVo;
import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.page.model.PageVo;

@Controller
@RequestMapping("/donation")
public class DonationController {

	private static final Logger logger = LoggerFactory.getLogger(DonationController.class);

	@Resource(name = "donationService")
	public IDonationService donationService;
	@Resource(name = "approvalService")
	public IApprovalService approvalService;

	/**
	 * Method : nonMemberInsertDonation 작성자 : ADMIN 변경이력 :
	 * 
	 * @return Method 설명 : 비회원 기부 요청
	 */
	@RequestMapping(path = "/nonmemberDonation", method = RequestMethod.GET)
	public String nonMemberInsertDonation() {

		return "/donation/nonmemberDonation";
	}

	/**
	 * Method : nonMemberInsertDonation 작성자 : ADMIN 변경이력 :
	 * 
	 * @param model
	 * @param approvalVo
	 * @param donationVo
	 * @param donationApprovalVo
	 * @return Method 설명 :비회원 기부
	 */
	@RequestMapping(path = "/nonmemberDonation", method = RequestMethod.POST)
	public String nonMemberInsertDonation(Model model, ApprovalVo approvalVo, DonationVo donationVo,
			DonationApprovalVo donationApprovalVo) {

		approvalVo.setApp_id(donationApprovalVo.getApp_id());
		approvalVo.setApp_pay(donationApprovalVo.getApp_pay());
		approvalVo.setApp_time(donationApprovalVo.getApp_time());
		approvalVo.setApp_type("3");
		approvalVo.setApp_del("N");
//      approvalVo.setMem_id("비회원");
	

		logger.debug("☞approvalVo:{}", approvalVo);

		int insertApproval_nonCnt = approvalService.insertApproval_non(approvalVo);

		logger.debug("☞insertApproval_nonCnt:{}", insertApproval_nonCnt);

		donationVo.setApp_id(approvalService.currentApproval());
		donationVo.setDon_id(donationApprovalVo.getDon_id());
		donationVo.setDoner(donationApprovalVo.getDoner());
		donationVo.setDoner_comment(donationApprovalVo.getDoner_comment());
		donationVo.setDoner_phone(donationApprovalVo.getDoner_phone());
		donationVo.setMem_yn("N");

		logger.debug("☞donationVo:{}", donationVo);

		logger.debug("☞donationApprovalVo:{}", donationApprovalVo);

		int insertDonation_nonCnt = donationService.insertDonation_non(donationVo);

		logger.debug("☞insertDonationCnt:{}", insertDonation_nonCnt);

		if (insertApproval_nonCnt == 1 && insertDonation_nonCnt == 1) {

			model.addAttribute("donationApprovalVo", donationApprovalVo);
			model.addAttribute("donationVo", donationVo);
			model.addAttribute("approvalVo", approvalVo);

			return "/donation/detailDonation";
		} else {
			return "/login";
		}
	}

	/**
	 * Method : memberInsertDonation 작성자 : ADMIN 변경이력 :
	 * 
	 * @return Method 설명 : 회원 기부 요청
	 */
	@RequestMapping(path = "/memberDonation", method = RequestMethod.GET)
	public String memberInsertDonation(Model model, HttpSession session) {
		MemberVo memberVo = (MemberVo) session.getAttribute("MEM_INFO");
		model.addAttribute("memberVo",memberVo);
		
		return "donation/memberDonation";
	}

	/**
	 * Method : memberInsertDonation 작성자 : ADMIN 변경이력 :
	 * 
	 * @param model
	 * @param approvalVo
	 * @param donationVo
	 * @param donationApprovalVo
	 * @return Method 설명 :회원 기부
	 */
	@RequestMapping(path = "/memberDonation", method = RequestMethod.POST)
	public String memberInsertDonation(Model model, String imp_uid, ApprovalVo approvalVo, DonationVo donationVo,
			DonationApprovalVo donationApprovalVo, HttpSession session) {

		approvalVo.setApp_id(donationApprovalVo.getApp_id());
		approvalVo.setApp_pay(donationApprovalVo.getApp_pay());
		approvalVo.setApp_time(donationApprovalVo.getApp_time());
		approvalVo.setApp_type("3");
		approvalVo.setApp_del("N");

		MemberVo memberVo = (MemberVo) session.getAttribute("MEM_INFO");
		logger.debug("☞memberVo:{}", memberVo);
		approvalVo.setMem_id(memberVo.getMem_id());
		logger.debug("☞memberVo.getMem_id():{}", memberVo.getMem_id());
//      mem_id = memVo.getMem_id();

		logger.debug("☞approvalVo:{}", approvalVo);

		int insertApproval_memCnt = approvalService.insertApproval_mem(approvalVo);

		logger.debug("☞insertApproval_memCnt:{}", insertApproval_memCnt);

		donationVo.setApp_id(approvalService.currentApproval());
		donationVo.setDon_id(donationApprovalVo.getDon_id());
//		donationVo.setDoner(donationApprovalVo.getDoner());
		donationVo.setDoner(memberVo.getMem_nm());
		logger.debug("☞memberVo.getMem_nm():{}",memberVo.getMem_nm());

//		donationVo.setDoner_phone(donationApprovalVo.getDoner_phone());
		donationVo.setDoner_phone(memberVo.getMem_phone());
		logger.debug("☞memberVo.getMem_phone():{}",memberVo.getMem_phone());
		
		donationVo.setDoner_comment(donationApprovalVo.getDoner_comment());
		donationVo.setMem_yn("Y");

		logger.debug("☞donationVo:{}", donationVo);

		logger.debug("☞donationApprovalVo:{}", donationApprovalVo);

		int insertDonation_memCnt = donationService.insertDonation_mem(donationVo);

		logger.debug("☞insertDonation_memCnt:{}", insertDonation_memCnt);
		
		
		
		if (insertApproval_memCnt == 1 && insertDonation_memCnt == 1) {

			model.addAttribute("donationApprovalVo", donationApprovalVo);
			model.addAttribute("donationVo", donationVo);
			model.addAttribute("approvalVo", approvalVo);
		
			logger.debug("☞donationApprovalVo:{}", donationApprovalVo);
			logger.debug("☞donationVo:{}", donationVo);
			logger.debug("☞approvalVo:{}", approvalVo);

//         return "donation/detailDonation";
			return "jsonView";
		} else {
			return "/login";
		}
	}

	/**
	 * Method : checkDonation 작성자 : ADMIN 변경이력 :
	 * 
	 * @param model
	 * @param donationApprovalVo
	 * @return Method 설명 :기부 상세보기
	 */
	@RequestMapping(path = "/detailDonation", method = RequestMethod.GET)
	public String checkDonation(Model model, DonationApprovalVo donationApprovalVo, ApprovalVo approvalVo,
			DonationVo donationVoss) {

		int app_id = approvalService.currentApproval();
		logger.debug("☞app_id:{}", app_id);

		donationApprovalVo = donationService.getDonationApproval(app_id);
//      donationApprovalVo.setApp_id(app_id);
		model.addAttribute("donationApprovalVo", donationApprovalVo);

//      model.addAttribute("donationApprovalVo", donationService.getDonationApproval(app_id));
		logger.debug("☞donationApprovalVo:{}", donationApprovalVo);

		return "donation/detailDonation";
	}

	// --------------- 관리자

	/**
	 * Method : donationPagingList 작성자 : ADMIN 변경이력 :
	 * 
	 * @return Method 설명 :관리자 페이지에서 기부자 전체목록 가져오기
	 */
	@RequestMapping(path = "/pagingList", method = RequestMethod.GET)
	public String donationPagingList(Model model, PageVo pageVo, int page, int pageSize) {

		pageVo = new PageVo();
		pageVo.setPage(page);
		pageVo.setPageSize(pageSize);

		Map<String, Object> resultMap = donationService.donationPagingList(pageVo);

		logger.debug("☞resultMap:{}", resultMap);

		List<DonationApprovalVo> getAllDonerList = (List<DonationApprovalVo>) resultMap.get("getAllDonerList");

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

		logger.debug("☞getAllDonerList:{}", getAllDonerList);

		model.addAttribute("getAllDonerList", getAllDonerList);
		model.addAttribute("startPage", startPage);
		model.addAttribute("paginationSize", paginationSize);
		model.addAttribute("lastpaginationSize", lastpaginationSize);
		model.addAttribute("pageVo", pageVo);

		logger.debug("☞getAllDonerList:{}", getAllDonerList);
		logger.debug("☞paginationSize:{}", paginationSize);
		logger.debug("☞pageVo:{}", pageVo);

		return "/mypage/donation/donationPagingList.mytiles";
	}


}
