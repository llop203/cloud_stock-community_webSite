package com.cloudStock.erp;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MyPageServiceImpl implements MyPageService{
	@Autowired
	private MyPageDAO myPageDAO;

	public MyPageDTO getMyPage(MyPageDTO myPageDTO) {
		
		MyPageDTO mypage = this.myPageDAO.getMyPage(myPageDTO);
		
		return mypage;
		
	}
	
	public int updateMyPage(MyPageDTO myPageDTO) {
		
		int myPageUpCnt = this.myPageDAO.updateMyPage(myPageDTO);
		return myPageUpCnt;
	}
	
	public int deleteMyPage(MyPageDTO myPageDTO) {
		
		int adminCnt = this.myPageDAO.adminCheck(myPageDTO);
		
		if(adminCnt>0) {
			return -1;
		}
		
		int myPageDelCnt = this.myPageDAO.deleteMyPage(myPageDTO);
		
		
		
		return myPageDelCnt;
	}
	
	
}
