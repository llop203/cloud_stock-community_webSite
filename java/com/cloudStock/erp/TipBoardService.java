package com.cloudStock.erp;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public interface TipBoardService {
	List<Map<String,String>> getTipBoardList(TipBoardSearchDTO tipBoardSearchDTO);
	int getTipBoardListAllCnt(TipBoardSearchDTO tipBoardSearchDTO);
	public TipBoardDTO getTipBoard(int tip_b_no);
	int insertTipBoard(TipBoardDTO tipBoardDTO, MultipartFile multi) throws Exception;
	public TipBoardDTO getTipBoardDTO_without_upReadCount(int tip_b_no);
	int updateTipBoard(TipBoardDTO tipBoardDTO, MultipartFile multi) throws Exception;
	int deleteTipBoard(TipBoardDTO tipBoardDTO);
	
	public TipBoardDTO getAdmin_pwd(TipBoardDTO tipBoardDTO);
}
