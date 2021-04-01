package com.cloudStock.erp;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class JoinDAOImpl implements JoinDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	
	public int getjoinCnt(JoinDTO joinDTO) {
		int joinCnt = this.sqlSession.insert(
			"com.cloudStock.erp.JoinDAO.getjoinCnt"
			,joinDTO
	);
		return joinCnt;

	}
	public int idCheckCnt(JoinDTO joinDTO) {
		int getidCheckCnt = this.sqlSession.selectOne(
				"com.cloudStock.erp.JoinDAO.idCheckCnt"
				, joinDTO);
		return getidCheckCnt;
	}
}
