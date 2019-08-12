package kr.or.ddit.member.memberDisease.dao;

import java.util.List;

import kr.or.ddit.member.memberDisease.model.MemberDiseaseVo;

public interface IMemberDiseaseDao {

	List<MemberDiseaseVo> getMemDisList(String mem_id);

}
