package kr.or.ddit.survey.service.video;

import java.util.List;

import kr.or.ddit.survey.model.VideoVo;

public interface IVideoService {
	
	VideoVo getVideo(int sur_id);

	
	List<VideoVo> getAllVideos();

}
