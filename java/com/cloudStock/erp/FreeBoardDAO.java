package com.cloudStock.erp;

import java.util.List;
import java.util.Map;

public interface FreeBoardDAO {

	public int insertBoard(FreeBoardDTO freeBoardDTO);

	public List<Map<String, String>> getBoardList(FreeBoardSearchDTO freeBoardSearchDTO);

	public FreeBoardDTO getBoard(int free_b_no);

	public int updateReadcount(int free_b_no);

	public int getBoardCnt(FreeBoardDTO board);
	
	public int updateBoard(FreeBoardDTO board);
	
	public int deleteBoard(FreeBoardDTO board);

	public int getBoardListAllCnt(FreeBoardSearchDTO freeBoardSearchDTO);

	//---------------------------------------------------------------------------------------------
	public int insertReply(FreeBoardDTO freeBoardDTO);
	//---------------------------------------------------------------------------------------------

	public int updatePrintNo(FreeBoardDTO freeBoardDTO);
	
	public List<Map<String, String>> getReplyList(FreeBoardDTO freeBoardDTO);

	public int getReplyListAllCnt(FreeBoardDTO freeBoardDTO);


	//===============================================================================

	public List<Map<String, String>> get_free_heartList(FreeBoardDTO freeBoardDTO);
	
	public int heartCount(FreeBoardDTO freeBoardDTO);

	public int getFreeHeartUp(FreeBoardDTO freeBoardDTO);

	public int getIsHeart_insert(FreeBoardDTO freeBoardDTO);

	public int getFreeHeartDown(FreeBoardDTO freeBoardDTO);

	public int getIsHeartDel(FreeBoardDTO freeBoardDTO);

	public int getWithout_updateReadCnt(FreeBoardDTO freeBoardDTO);
	
	//===============================================================================
}
