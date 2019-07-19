package kr.or.ddit.video.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.video.dao.IVideoDao;

@Service
public class VideoService implements IVideoService {

	@Resource(name = "videoDao")
	private IVideoDao videoDao;
}
