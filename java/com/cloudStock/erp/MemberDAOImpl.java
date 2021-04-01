package com.cloudStock.erp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public List<Map<String, String>> memberListForm(MemberSearchDTO memberSearchDTO){
		List<Map<String, String>> memberList = this.sqlSession.selectList(
				"com.cloudStock.erp.MemberDAO.memberListForm",
				memberSearchDTO
				);
		
		return memberList;
	}
	
	public int getMemberListAllCnt(MemberSearchDTO memberSearchDTO) {
		int listAllCnt = this.sqlSession.selectOne(
				"com.cloudStock.erp.MemberDAO.getMemberListAllCnt",
				memberSearchDTO
				);
		
		return listAllCnt;
	}
	

}
