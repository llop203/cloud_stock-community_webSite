package com.cloudStock.erp;

import java.util.List;
import java.util.Map;

public interface LoginService {

	public int loginCnt(Map<String, String>map);

	public LoginDTO getsearchID(LoginDTO loginDTO);

	public int checkID(LoginDTO loginDTO);

	public int getchangePWD(LoginDTO loginDTO);
	
	public LoginDTO getUserNo(LoginDTO loginDTO);
	
	public LoginDTO getUserNumber(Map<String, String>map);
	
	public int getChangePwdCnt(LoginDTO loginDTO);
	






	





}
