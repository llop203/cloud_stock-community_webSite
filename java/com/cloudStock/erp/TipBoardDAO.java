package com.cloudStock.erp;

import java.util.*;

public interface TipBoardDAO {
	List<Map<String,String>> getTipBoardList(TipBoardSearchDTO tipBoardSearchDTO);
	int getTipBoardListAllCnt(TipBoardSearchDTO tipBoardSearchDTO);
	public TipBoardDTO getTipBoard(int tip_b_no);
	int insertTipBoard(TipBoardDTO tipBoardDTO);
	int updateReadCount(int tip_b_no);
	int updateTipBoard(TipBoardDTO tipBoardDTO);
	int deleteTipBoard(TipBoardDTO tipBoardDTO);
	
	public TipBoardDTO getAdminPwd(TipBoardDTO tipBoardDTO);
}
