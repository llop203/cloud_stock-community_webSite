package com.cloudStock.erp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class FreeBoardServiceImpl implements FreeBoardService{
	@Autowired
	private FreeBoardDAO freeBoardDAO;

	
	
	public int insertBoard(FreeBoardDTO freeBoardDTO) {
		
		int boardRegCnt = this.freeBoardDAO.insertBoard(freeBoardDTO);

		return boardRegCnt;	
	}
	
	
	
	public int getBoardListAllCnt(FreeBoardSearchDTO freeBoardSearchDTO) {

		int boardListAllCnt = this.freeBoardDAO.getBoardListAllCnt(freeBoardSearchDTO);
		return boardListAllCnt;
	}
	
	

	public List<Map<String, String>> getBoardList(FreeBoardSearchDTO freeBoardSearchDTO){
		
		 List<Map<String, String>> boardList = this.freeBoardDAO.getBoardList(freeBoardSearchDTO);
		return boardList;
	}
	
	
	
	public FreeBoardDTO getBoard(int free_b_no) {

		int updateCnt = this.freeBoardDAO.updateReadcount(free_b_no);

		FreeBoardDTO board = null;
		
		if(updateCnt==1) {
			board = this.freeBoardDAO.getBoard(free_b_no);
		}
		
		return board;
	}

	
	
	public FreeBoardDTO getBoard_without_updateReadcount(int free_b_no) {
		
		FreeBoardDTO board = this.freeBoardDAO.getBoard(free_b_no);
		return board;		
	}
	
	
	
	public int updateBoard(FreeBoardDTO board) {

		int boardCnt = this.freeBoardDAO.getBoardCnt(board);
		if(boardCnt==0) {return -1;}

		int updateCnt = this.freeBoardDAO.updateBoard(board);

		return updateCnt;	
	}

	

	public int deleteBoard(FreeBoardDTO board) {
		
		int boardCnt = this.freeBoardDAO.getBoardCnt(board);
		if(boardCnt==0) {return -1;}	
		
		int deleteCnt = this.freeBoardDAO.deleteBoard(board);

		return deleteCnt;	
	}
	
	

	//---------------------------------------------------------------------------------------------
	public int insertReply(FreeBoardDTO freeBoardDTO) {
		
		int reply_no = freeBoardDTO.getReply_no();
		
		if(reply_no>0)	{
			int updatePrintNoCnt = this.freeBoardDAO.updatePrintNo(freeBoardDTO);
		}
		
		System.out.println("FreeBoardServiceImpl insertReply 진입성공");
		int boardReplyCnt = this.freeBoardDAO.insertReply(freeBoardDTO);
		System.out.println("FreeBoardServiceImpl insertReply DB 연동 성공");	
		return boardReplyCnt;	
	}
	//---------------------------------------------------------------------------------------------

	public List<Map<String, String>> getReplyList(FreeBoardDTO freeBoardDTO){

		List<Map<String,String>> replyList = this.freeBoardDAO.getReplyList(freeBoardDTO);
		
		return replyList;
		
	}
	
	

	public int getReplyListAllCnt(FreeBoardDTO freeBoardDTO) {
		
		int boardListAllCnt = this.freeBoardDAO.getReplyListAllCnt(freeBoardDTO);
		
		return boardListAllCnt;
		
	}
	
	//===========================================================================

	public List<Map<String, String>> get_free_heartList(FreeBoardDTO freeBoardDTO){
		
		 List<Map<String, String>> free_heartList = this.freeBoardDAO.get_free_heartList(freeBoardDTO);
		return free_heartList;
	}
	
    public int free_heart_btn_update(FreeBoardDTO freeBoardDTO) {
    	
    	int without_updateReadCnt = this.freeBoardDAO.getWithout_updateReadCnt(freeBoardDTO);
    	
    	
    	int heartCount = this.freeBoardDAO.heartCount(freeBoardDTO);
    	System.out.println(heartCount);
    	if(heartCount==0) {
    		int freeHeartUp = this.freeBoardDAO.getFreeHeartUp(freeBoardDTO);
    		int isHeart_insert = this.freeBoardDAO.getIsHeart_insert(freeBoardDTO);
    		//System.out.println(freeHeartUp);
    		//System.out.println(isHeart_insert);
    		return 1;
    	}else {
    		int freeHeartDown = this.freeBoardDAO.getFreeHeartDown(freeBoardDTO);
    		int isHeartDel = this.freeBoardDAO.getIsHeartDel(freeBoardDTO);
    		//System.out.println(freeHeartDown);
    		//System.out.println(isHeartDel);
    		return 1;
    	}
    }
    
    public int getHeartCnt(FreeBoardDTO freeBoardDTO) {
    	int heartCnt = this.freeBoardDAO.heartCount(freeBoardDTO);
    	
    	return heartCnt;
    }

	//===========================================================================
}
































