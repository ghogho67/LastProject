package kr.or.ddit.category.others.shelter.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.category.others.shelter.dao.IShelterDao;

@Service
public class ShelterService implements IShelterService {

	@Resource(name = "shelterDao")
	private IShelterDao shelterDao;
}
