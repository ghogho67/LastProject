package kr.or.ddit.member.dao;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.member.member.dao.IMemberDao;
import kr.or.ddit.testenv.LogicTestEnv;

public class MemberDaoTest extends LogicTestEnv{

	@Resource(name = "memberDao")
	private IMemberDao memberDao;
	@Test
	public void getMemList() {
		
	
	}

}
