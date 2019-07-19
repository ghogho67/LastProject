package kr.or.ddit.member.member.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.member.member.dao.IMemberDao;

@Service
public class MemberService implements IMemberService {
	@Resource(name = "memberDao")
	private IMemberDao memberDao;
}
