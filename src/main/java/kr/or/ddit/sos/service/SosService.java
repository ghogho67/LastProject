package kr.or.ddit.sos.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.sos.dao.ISosDao;

@Service
public class SosService implements ISosService {

	@Resource(name = "sosDao")
	private ISosDao sosDao;
}
