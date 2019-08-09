package kr.or.ddit.survey.service.video;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.survey.dao.video.IVideoDao;
import kr.or.ddit.survey.model.VideoVo;


@Service
public class VideoService implements IVideoService {

	@Resource(name = "videoDao")
	private IVideoDao videoDao;

	@Override
	public VideoVo getVideo(int sur_id) {
		return videoDao.getVideo(sur_id);
	}

	@Override
	public List<VideoVo> getAllVideos() {
		return videoDao.getAllVideos();
	}
}
