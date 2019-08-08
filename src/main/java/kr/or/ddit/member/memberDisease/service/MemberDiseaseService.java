package kr.or.ddit.member.memberDisease.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.member.memberDisease.dao.IMemberDiseaseDao;
import kr.or.ddit.member.memberDisease.model.MemberDiseaseVo;

@Service
public class MemberDiseaseService implements IMemberDiseaseService {

	@Resource(name = "memberDiseaseDao")
	private IMemberDiseaseDao memberDiseaseDao;

	@Override
	public List<MemberDiseaseVo> getMemDisList(String mem_id) {
		return memberDiseaseDao.getMemDisList(mem_id);
	}

}
