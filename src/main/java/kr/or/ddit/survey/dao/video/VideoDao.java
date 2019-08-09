package kr.or.ddit.survey.dao.video;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.survey.model.VideoVo;

@Repository
public class VideoDao implements IVideoDao {
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;

	@Override
	public VideoVo getVideo(int sur_id) {
		return sqlSession.selectOne("survey.getVideo",sur_id);
	}

	@Override
	public List<VideoVo> getAllVideos() {
		return sqlSession.selectList("survey.getAllVideos");
	}
	

}
