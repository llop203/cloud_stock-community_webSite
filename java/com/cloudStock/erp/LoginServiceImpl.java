package com.cloudStock.erp;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class LoginServiceImpl implements LoginService{
	@Autowired
	private LoginDAO loginDAO;

	public int loginCnt(Map<String, String>map) {
		
		// 관리자 회원 들어가기
		int getAdminCnt = this.loginDAO.adminCnt(map);

		// 일반 회원 들어가기
		int getLoginCnt = this.loginDAO.loginCnt(map);
		
		if(getLoginCnt==0) {getLoginCnt= -2;}
		if(getAdminCnt==1) {getLoginCnt=-1;}
		return getLoginCnt;
	}
	
	public LoginDTO getUserNumber(Map<String, String>map) {
		LoginDTO user_no = this.loginDAO.getUserNumber(map);
		return user_no;
		
	}
	
	public LoginDTO getsearchID(LoginDTO loginDTO) {
		LoginDTO SearchID = this.loginDAO.getsearchID(loginDTO);
		return SearchID;
	}

	public int checkID(LoginDTO loginDTO) {
		int getcheckID = this.loginDAO.checkID(loginDTO);
		return getcheckID;
	}
	
	public int getchangePWD(LoginDTO loginDTO) {
		
		int pwdCheckCnt = this.loginDAO.getPwdCheckCnt(loginDTO);
		if(pwdCheckCnt!=1) {
			return -1;
		}
		
		int changePWD = this.loginDAO.getchangePWD(loginDTO);
		return changePWD;
	}
	
	public LoginDTO getUserNo(LoginDTO loginDTO) {
		LoginDTO UserNo = this.loginDAO.getUserNo(loginDTO);
		
		return UserNo;
	}
	
	public int getChangePwdCnt(LoginDTO loginDTO) {
		int changePWDCnt = this.loginDAO.getChangePWDCnt(loginDTO);
		return changePWDCnt;
	}

	
	
}
