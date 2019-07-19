package kr.or.ddit.gold.cardiac.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CardiacDao implements ICardiacDao {
	
	 @Resource(name = "sqlSession")
	 private SqlSessionTemplate sqlSession;
	 

}
