package com.cloudStock.erp;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TipBoardDAOImpl implements TipBoardDAO{
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	public List<Map<String,String>> getTipBoardList(TipBoardSearchDTO tipBoardSearchDTO){
		List<Map<String,String>> tipboardList = this.sqlSession.selectList(
				"com.cloudStock.erp.TipBoardDAO.getTipBoardList"
				, tipBoardSearchDTO
		);
		return tipboardList;
	}
	
	public int getTipBoardListAllCnt(TipBoardSearchDTO tipBoardSearchDTO) {
		int tipBoardListAllCnt = this.sqlSession.selectOne(
				"com.cloudStock.erp.TipBoardDAO.getTipBoardAllCnt"
				, tipBoardSearchDTO
		);
		return tipBoardListAllCnt;
	}
	
	public int updateReadCount(int tip_b_no) {
		int updateCnt = this.sqlSession.update(
				"com.cloudStock.erp.TipBoardDAO.updateReadCount"  
				, tip_b_no									  
			);	
			return updateCnt;
		
	}
	
	public int updateTipBoard(TipBoardDTO tipBoardDTO) {
		int updateCnt = this.sqlSession.update(
				"com.cloudStock.erp.TipBoardDAO.updateTipBoard"  
				, tipBoardDTO		
		);
		return updateCnt;
				
	}
	
	public int deleteTipBoard(TipBoardDTO tipBoardDTO) {
		int deleteCnt = this.sqlSession.update(
				"com.cloudStock.erp.TipBoardDAO.trashTipBoard"
				, tipBoardDTO
		);
		return deleteCnt;
	}
	
	public TipBoardDTO getTipBoard(int tip_b_no) {
		TipBoardDTO tipBoard = this.sqlSession.selectOne(
				"com.cloudStock.erp.TipBoardDAO.getTipBoard"
				,tip_b_no
		);
		return tipBoard;
	}
	
	public int insertTipBoard(TipBoardDTO tipBoardDTO) {
		System.out.println("tipboardDAO 진입");
		int tipBoardRegCnt = this.sqlSession.insert(
				"com.cloudStock.erp.TipBoardDAO.insertTipBoard"
				, tipBoardDTO
		);
		System.out.println("tipboardDAO 나감");
		System.out.println(tipBoardRegCnt);
		return tipBoardRegCnt;
	}
	
	public TipBoardDTO getAdminPwd(TipBoardDTO tipBoardDTO) {
		TipBoardDTO adminPwd = this.sqlSession.selectOne(
				"com.cloudStock.erp.TipBoardDAO.getAdminPwd"
				,tipBoardDTO
		);
		return adminPwd;
	}



}
