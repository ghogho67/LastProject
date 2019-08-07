package kr.or.ddit.survey.service.video;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.survey.dao.video.IVideoDao;


@Service
public class VideoService implements IVideoService {

	@Resource(name = "videoDao")
	private IVideoDao videoDao;
}
