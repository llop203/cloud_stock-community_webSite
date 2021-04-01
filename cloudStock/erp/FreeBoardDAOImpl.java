package com.cloudStock.erp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FreeBoardDAOImpl implements FreeBoardDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	public List<Map<String, String>> getBoardList(FreeBoardSearchDTO freeBoardSearchDTO){
		
		
		List<Map<String, String>> boardList = this.sqlSession.selectList(
				"com.cloudStock.erp.FreeBoardDAO.getBoardList"
				,freeBoardSearchDTO
		);
		return boardList;
	}

	
	
	public int insertBoard(FreeBoardDTO freeBoardDTO) {

		int boardRegCnt = this.sqlSession.insert(
				"com.cloudStock.erp.FreeBoardDAO.insertBoard"	
				,freeBoardDTO								
		);
		return boardRegCnt;
	}

	
	
	public FreeBoardDTO getBoard(int free_b_no) {

		FreeBoardDTO board = this.sqlSession.selectOne(
				"com.cloudStock.erp.FreeBoardDAO.getBoard"
				, free_b_no
				
		);
		return board;
	}
		
	public int updateReadcount(int free_b_no) {

		int updateCnt = this.sqlSession.update(
				"com.cloudStock.erp.FreeBoardDAO.updateReadcount"
				, free_b_no
		);	
		return updateCnt;
	}
	
	
	
	public int getBoardCnt(FreeBoardDTO board) {
		int boardCnt = this.sqlSession.selectOne(
				"com.cloudStock.erp.FreeBoardDAO.getBoardCnt"
				, board
		);
		return boardCnt;
	};
	
	
	
	public int updateBoard(FreeBoardDTO board) {
		int updateCnt = this.sqlSession.update(
				"com.cloudStock.erp.FreeBoardDAO.updateBoard"
				, board
		);
		return updateCnt;
	};
	
		
	
	public int deleteBoard(FreeBoardDTO board) {
		int deleteCnt = this.sqlSession.update(
				"com.cloudStock.erp.FreeBoardDAO.deleteBoard"
				, board
		);
		return deleteCnt;
	};
	
	
	
	public int getBoardListAllCnt(FreeBoardSearchDTO freeBoardSearchDTO) {
		int boardListAllCnt = this.sqlSession.selectOne(
				"com.cloudStock.erp.FreeBoardDAO.getBoardListAllCnt"
				,freeBoardSearchDTO
		);
		return boardListAllCnt;
	}
	
	
	

	//---------------------------------------------------------------------------------------------
	public int insertReply(FreeBoardDTO freeBoardDTO) {
		System.out.println("FreeBoardDAO insertReply 진입성공");
		
		int boardReplyCnt = this.sqlSession.insert(
				"com.cloudStock.erp.FreeBoardDAO.insertReply"	
				,freeBoardDTO								
		);
		System.out.println("FreeBoardDAO insertReply DB 연동 성공");	
		
		return boardReplyCnt;
		
	}
	//---------------------------------------------------------------------------------------------
	
	
	
	public int updatePrintNo(FreeBoardDTO freeBoardDTO) {

		int updatePrintNoCnt = this.sqlSession.update(
				"com.cloudStock.erp.FreeBoardDAO.updatePrintNo"
				, freeBoardDTO
		);
		return updatePrintNoCnt;
		
	}
	
	
	
	public List<Map<String, String>> getReplyList(FreeBoardDTO freeBoardDTO){
		
		List<Map<String,String>> replyList = this.sqlSession.selectList(
				"com.cloudStock.erp.FreeBoardDAO.getReplyList"
				,freeBoardDTO
		);
		
		return replyList;
	}
	

	public int getReplyListAllCnt(FreeBoardDTO freeBoardDTO) {
		int replyListAllCnt = this.sqlSession.selectOne(
				"com.cloudStock.erp.FreeBoardDAO.getReplyListAllCnt"
				,freeBoardDTO
		);
		return replyListAllCnt;
	}
	
	//============================================================================

    public List<Map<String, String>> get_free_heartList(FreeBoardDTO freeBoardDTO){
		
		
		List<Map<String, String>> free_heartList = this.sqlSession.selectList(
				"com.cloudStock.erp.FreeBoardDAO.get_free_heartList"
				,freeBoardDTO
		);
		return free_heartList;
	}

    public int free_heart_btn_update(FreeBoardDTO freeBoardDTO) {

		int free_heart_btn_update = this.sqlSession.update(
				"com.cloudStock.erp.FreeBoardDAO.free_heart_btn_update"	
				,freeBoardDTO								
		);
		return free_heart_btn_update;
	}
    
    public int heartCount(FreeBoardDTO freeBoardDTO) {

		int free_heart_btn_update = this.sqlSession.selectOne(
				"com.cloudStock.erp.FreeBoardDAO.heartCount"	
				,freeBoardDTO								
		);
		return free_heart_btn_update;
	}
    

	 public int getFreeHeartUp(FreeBoardDTO freeBoardDTO) {
	  
		 int free_heart_btn_update = this.sqlSession.update(
		       "com.cloudStock.erp.FreeBoardDAO.getFreeHeartUp" 
			   ,freeBoardDTO 
		 ); 
		  return free_heart_btn_update; 
	 }
	 

	  public int getIsHeart_insert(FreeBoardDTO freeBoardDTO) {
	  
		  int free_heart_btn_update = this.sqlSession.insert(
		       "com.cloudStock.erp.FreeBoardDAO.getIsHeart_insert" 
			   ,freeBoardDTO 
		  ); 
		  return free_heart_btn_update; 
	  }
	  
	  
	 public int getFreeHeartDown(FreeBoardDTO freeBoardDTO) {
		 
		 int free_heart_btn_update = this.sqlSession.update(
		        "com.cloudStock.erp.FreeBoardDAO.getFreeHeartDown" 
				 ,freeBoardDTO 
		 ); 
		 return free_heart_btn_update; 
	 }
	 

	 public int getIsHeartDel(FreeBoardDTO freeBoardDTO) {
	 
		 int free_heart_btn_update = this.sqlSession.delete(
			     "com.cloudStock.erp.FreeBoardDAO.getIsHeartDel" 
				 ,freeBoardDTO 
		 ); 
		 return free_heart_btn_update; 
	 }
	 
	 public int getWithout_updateReadCnt(FreeBoardDTO freeBoardDTO) {
	       
	       int free_heart_btn_update = this.sqlSession.delete(
	              "com.cloudStock.erp.FreeBoardDAO.getWithout_updateReadCnt" 
	             ,freeBoardDTO 
	       ); 
	       return free_heart_btn_update; 
	 } 

	
	//============================================================================
	
}

