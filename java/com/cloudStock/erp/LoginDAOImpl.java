package com.cloudStock.erp;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class LoginDAOImpl implements LoginDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public int adminCnt(Map<String, String>map) {
		int getadminCnt = this.sqlSession.selectOne(
				"com.cloudStock.erp.LoginDAO.getAdminCnt"
				, map);
		

		
		return getadminCnt;
	}
	
	public LoginDTO getUserNumber(Map<String, String>map) {
		LoginDTO emp_no = this.sqlSession.selectOne(
				"com.cloudStock.erp.LoginDAO.getUserNumber"
				, map
		);
		
		return emp_no;
	}


	
	public int loginCnt(Map<String, String>map) {
		
		int getLoginCnt = this.sqlSession.selectOne(
				"com.cloudStock.erp.LoginDAO.getLoginCnt"
				, map);
		
		
		return getLoginCnt;
	}
	
	public LoginDTO getsearchID(LoginDTO loginDTO) {
		LoginDTO SearchID = this.sqlSession.selectOne(
				"com.cloudStock.erp.LoginDAO.getsearchID"
				, loginDTO);
		return SearchID;
	}
	
	public int checkID(LoginDTO loginDTO) {
		int getcheckID = this.sqlSession.selectOne(
				"com.cloudStock.erp.LoginDAO.checkID"
				, loginDTO);
		return getcheckID;
	}
	
	public int getchangePWD(LoginDTO loginDTO) {
		int changePWD = this.sqlSession.selectOne(
				"com.cloudStock.erp.LoginDAO.getchangePWD"
				, loginDTO);
		return changePWD;
		
	}
	
	public int getPwdCheckCnt(LoginDTO loginDTO) {
		int pwdCheckCnt = this.sqlSession.selectOne(
				"com.cloudStock.erp.LoginDAO.getPwdCheckCnt"
				, loginDTO);
		return pwdCheckCnt;
	}
	
	public LoginDTO getUserNo(LoginDTO loginDTO) {
		LoginDTO UserNo = this.sqlSession.selectOne(
				"com.cloudStock.erp.LoginDAO.getUserNo"
				, loginDTO);
		
		return UserNo;
	}
	
	public int getChangePWDCnt(LoginDTO loginDTO) {
		int ChangePWDCnt = this.sqlSession.update(
				"com.cloudStock.erp.LoginDAO.getChangePWDCnt"
				, loginDTO
		);
		return ChangePWDCnt;
	}
	


	
}
