package kr.or.ddit.gold.cardiac.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.gold.cardiac.model.CardiacVo;

@Repository
public class CardiacDao implements ICardiacDao {
	
	 @Resource(name = "sqlSession")
	 private SqlSessionTemplate sqlSession;

	@Override
	public int insertCardiac(CardiacVo cardiacVo) {
		return sqlSession.insert("");
	}


	 

}
