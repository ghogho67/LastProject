package kr.or.ddit.survey.dao.video;

import java.util.List;

import kr.or.ddit.survey.model.VideoVo;

public interface IVideoDao {
	
	VideoVo getVideo(int sur_id);

	List<VideoVo> getAllVideos();
	
}
																																																																																																																																							