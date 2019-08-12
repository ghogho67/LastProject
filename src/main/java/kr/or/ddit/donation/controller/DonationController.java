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
	public String nonMemberInsertDonation(Model model) {
		
		ApprovalVo approvalVo = null;
		approvalVo.setApp_id(approvalVo.getApp_id());
		approvalVo.setApp_pay(approvalVo.getApp_pay());
		approvalVo.setApp_time(approvalVo.getApp_time());
		approvalVo.setApp_type(approvalVo.getApp_type());
		approvalVo.setApp_del(approvalVo.getApp_del());
//		approvalVo.setMem_id(approvalVo.getMem_id());
		
		logger.debug("☞approvalVo:{}",approvalVo);
		
		int insertDonationApprovalCnt = donationService.insertDonationApproval(approvalVo);
		
		logger.debug("☞insertDonationApprovalCnt:{}",insertDonationApprovalCnt);
		
		
		DonationVo donationVo = null;
		
		donationVo.setApp_id(donationService.currentApproval());
		donationVo.setDon_id(donationVo.getDon_id());
		donationVo.setDoner(donationVo.getDoner());
		donationVo.setDoner_comment(donationVo.getDoner_comment());
		donationVo.setDoner_phone(donationVo.getDoner_phone());
		
		logger.debug("☞donationVo:{}",donationVo);
		
		int insertDonationCnt = donationService.insertDonation(donationVo);
		
		logger.debug("☞insertDonationCnt:{}",insertDonationCnt);
		
		if(insertDonationApprovalCnt == 1 && insertDonationCnt == 1) {
			
			return "/donation/nonmemberDonation";
		}else {
			return "/login";
		}
		
		
	}

}
