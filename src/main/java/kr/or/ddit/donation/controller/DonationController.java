package kr.or.ddit.donation.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.approval.model.ApprovalVo;
import kr.or.ddit.donation.model.DonationVo;
import kr.or.ddit.donation.service.IDonationService;
import kr.or.ddit.joinVo.DonationApprovalVo;

@Controller
@RequestMapping("/donation")
public class DonationController {
	
	private static final Logger logger = LoggerFactory.getLogger(DonationController.class);
	
	@Resource(name = "donationService")
	public IDonationService donationService;
	
	
	@RequestMapping(path = "/nonmemberDonation", method = RequestMethod.GET)
	public String nonMemberInsertDonation() {
		
		return "/donation/nonmemberDonation"; 
	}
	
	
	@RequestMapping(path = "/nonmemberDonation", method = RequestMethod.POST)
	public String nonMemberInsertDonation(Model model, ApprovalVo approvalVo, DonationVo donationVo, DonationApprovalVo donationApprovalVo) {
		
		approvalVo.setApp_id(donationApprovalVo.getApp_id());
		approvalVo.setApp_pay(donationApprovalVo.getApp_pay());
		approvalVo.setApp_time(donationApprovalVo.getApp_time());
		approvalVo.setApp_type("3");
		approvalVo.setApp_del("N");
		approvalVo.setMem_id("");
		
		logger.debug("☞approvalVo:{}",approvalVo);
		
		int insertDonationApprovalCnt = donationService.insertDonationApproval(approvalVo);
		
		logger.debug("☞insertDonationApprovalCnt:{}",insertDonationApprovalCnt);
		
		
		donationVo.setApp_id(donationService.currentApproval());
		donationVo.setDon_id(donationApprovalVo.getDon_id());
		donationVo.setDoner(donationApprovalVo.getDoner());
		donationVo.setDoner_comment(donationApprovalVo.getDoner_comment());
		donationVo.setDoner_phone(donationApprovalVo.getDoner_phone());
		
		logger.debug("☞donationVo:{}",donationVo);
		
		int insertDonationCnt = donationService.insertDonation(donationVo);
		
		logger.debug("☞insertDonationCnt:{}",insertDonationCnt);
		
		if(insertDonationApprovalCnt == 1 && insertDonationCnt == 1) {
			
			return "/donation/detailDonation";
		}else {
			return "/login";
		}
	}
	
	@RequestMapping(name = "/detailDonation", method = RequestMethod.GET)
	public String checkDonation(Model model, DonationApprovalVo donationApprovalVo ) {
		
		model.addAttribute("donationApprovalVo", donationService.getDonationApproval(donationApprovalVo.getApp_id()));
		
		return "/donation/checkDonation";
	}

}
