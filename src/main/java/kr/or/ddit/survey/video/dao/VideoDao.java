package kr.or.ddit.survey.video.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class VideoDao implements IVideoDao {
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
	

}
