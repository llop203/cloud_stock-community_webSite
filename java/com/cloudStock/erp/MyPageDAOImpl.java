package com.cloudStock.erp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageDAOImpl implements MyPageDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public MyPageDTO getMyPage(MyPageDTO myPageDTO) {
		MyPageDTO mypage = this.sqlSession.selectOne(
				"com.cloudStock.erp.MyPageDAO.getMyPage"
				, myPageDTO
		);
		return mypage;
	}
	
	public int updateMyPage(MyPageDTO myPageDTO) {
		int updateCnt  = this.sqlSession.update(
				"com.cloudStock.erp.MyPageDAO.updateMyPage"
				, myPageDTO
		);
		return updateCnt;
	}
	
	public int deleteMyPage(MyPageDTO myPageDTO) {
		int deleteCnt = this.sqlSession.delete(
				"com.cloudStock.erp.MyPageDAO.deleteUser"
				, myPageDTO
		);
		return deleteCnt;
	}
	
	public int adminCheck(MyPageDTO myPageDTO) {
		int adminCnt = this.sqlSession.selectOne(
				"com.cloudStock.erp.MyPageDAO.getAdminCnt"
				, myPageDTO
			);
		return adminCnt;
	}

}
