package kr.or.ddit.freeAttach.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.freeAttach.dao.IFreeAttachDao;

@Service
public class FreeAttachService implements IFreeAttachService {
	
	@Resource(name = "freeAttachDao")
	private IFreeAttachDao freeAttachDao;

}
