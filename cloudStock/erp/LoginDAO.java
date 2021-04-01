package com.cloudStock.erp;

import java.util.Map;

public interface LoginDAO {
	public int loginCnt(Map<String, String>map);
	
	public int adminCnt(Map<String, String>map);
	
	public LoginDTO getsearchID(LoginDTO loginDTO);

	public int checkID(LoginDTO loginDTO);

	public int getchangePWD(LoginDTO loginDTO);

	public int getPwdCheckCnt(LoginDTO loginDTO);
	
	public LoginDTO getUserNo(LoginDTO loginDTO);
	
	public LoginDTO getUserNumber(Map<String, String>map);

	public int getChangePWDCnt(LoginDTO loginDTO);
	
	
	

}
