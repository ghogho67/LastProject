package kr.or.ddit.category.attachment.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AttachmentDao implements IAttachmentDao {

	@Resource(name = "sqlSession")
	private SqlSessionTemplate sqlSession;
}
