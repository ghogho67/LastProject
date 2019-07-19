package kr.or.ddit.category.post.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.category.post.dao.IPostDao;

@Service
public class PostService implements IPostService {
	@Resource(name = "postDao")
	private IPostDao postDao;
}
