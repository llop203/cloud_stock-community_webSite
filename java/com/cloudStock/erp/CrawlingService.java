package com.cloudStock.erp;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface CrawlingService {

	public String getStandardStockDate(CrawlingDTO crawlingDTO);
	public Map<String,String> getSelectedStockMap1(CrawlingDTO crawlingDTO);
	public Map<String,String> getSelectedStockMap2(CrawlingDTO crawlingDTO);
	public Map<String,String> getSelectedStockMap3(CrawlingDTO crawlingDTO);
	public List<Map<String,String>> getTopRankStockList(CrawlingDTO crawlingDTO); 
	
	public int getStockListAllCnt(CrawlingSearchDTO crawlingSearchDTO);	
	public List<Map<String,String>> getStockList(CrawlingSearchDTO crawlingSearchDTO);
	public int update_rateOfReturn(CrawlingDTO crawlingDTO);
	public List<Map<String,String>> getStockList2(CrawlingSearchDTO crawlingSearchDTO);
	

	public int updateSelected_Cnt(CrawlingDTO crawlingDTO);
	public List<Map<String,String>> getSelectedStockList(CrawlingDTO crawlingDTO);
	public Map<String,Double> getSelectedStockROR1(CrawlingDTO crawlingDTO);
	public Map<String,Double> getSelectedStockROR2(CrawlingDTO crawlingDTO);
	public Map<String,Double> getSelectedStockROR3(CrawlingDTO crawlingDTO);
	public List<Map<String,String>> getStockDateList1(CrawlingDTO crawlingDTO);
	public List<Map<String,String>> getStockDateList2(CrawlingDTO crawlingDTO);
	public List<Map<String,String>> getStockDateList3(CrawlingDTO crawlingDTO);
	public List<Map<String,Integer>> getClosePriceList1(CrawlingDTO crawlingDTO);
	public List<Map<String,Integer>> getClosePriceList2(CrawlingDTO crawlingDTO);
	public List<Map<String,Integer>> getClosePriceList3(CrawlingDTO crawlingDTO);
}
