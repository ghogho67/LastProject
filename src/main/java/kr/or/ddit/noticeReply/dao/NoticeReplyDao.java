package kr.or.ddit.noticeReply.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeReplyDao implements INoticeReplyDao{
 
	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
}
