package com.cloudStock.erp;

import java.util.List;
import java.util.Map;

public interface MyPageService {

	public MyPageDTO getMyPage(MyPageDTO myPageDTO);
	
	public int updateMyPage(MyPageDTO myPageDTO);

	public int deleteMyPage(MyPageDTO myPageDTO);

}
