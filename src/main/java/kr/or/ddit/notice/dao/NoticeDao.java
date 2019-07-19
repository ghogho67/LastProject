package kr.or.ddit.notice.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDao implements INoticeDao{
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
}
