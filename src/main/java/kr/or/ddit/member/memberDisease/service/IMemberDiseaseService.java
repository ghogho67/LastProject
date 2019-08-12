package kr.or.ddit.member.memberDisease.service;

import java.util.List;

import kr.or.ddit.member.memberDisease.model.MemberDiseaseVo;

public interface IMemberDiseaseService {

	List<MemberDiseaseVo> getMemDisList(String mem_id);

}
