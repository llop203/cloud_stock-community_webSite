package com.cloudStock.erp;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

public interface FreeBoardService {

	public int insertBoard(FreeBoardDTO freeBoardDTO);

	public List<Map<String, String>> getBoardList(FreeBoardSearchDTO freeBoardSearchDTO);

	public FreeBoardDTO getBoard(int free_b_no);
	
	public int getHeartCnt(FreeBoardDTO freeBoardDTO);

	public FreeBoardDTO getBoard_without_updateReadcount(int free_b_no);

	public int updateBoard(FreeBoardDTO board);
	
	public int deleteBoard(FreeBoardDTO board);

	public int getBoardListAllCnt(FreeBoardSearchDTO freeBoardSearchDTO);

	//---------------------------------------------------------------------------------------------
	public int insertReply(FreeBoardDTO freeBoardDTO);
	//---------------------------------------------------------------------------------------------

	public List<Map<String, String>> getReplyList(FreeBoardDTO freeBoardDTO);

	public int getReplyListAllCnt(FreeBoardDTO freeBoardDTO);

	public List<Map<String, String>> get_free_heartList(FreeBoardDTO freeBoardDTO);

	public int free_heart_btn_update(FreeBoardDTO freeBoardDTO);
	
}
