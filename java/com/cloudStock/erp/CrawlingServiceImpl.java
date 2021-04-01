package com.cloudStock.erp;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CrawlingServiceImpl implements CrawlingService {

	
	@Autowired
	private CrawlingDAO crawlingDAO;

	public String getStandardStockDate(CrawlingDTO crawlingDTO) {
		String standardStockDate = this.crawlingDAO.getStandardStockDate(crawlingDTO);
		return standardStockDate;
	};
	public Map<String,String> getSelectedStockMap1(CrawlingDTO crawlingDTO){
		Map<String,String> selectedStockMap1 = this.crawlingDAO.getSelectedStockMap1(crawlingDTO);
		return selectedStockMap1;
	};
	public Map<String,String> getSelectedStockMap2(CrawlingDTO crawlingDTO){
		Map<String,String> selectedStockMap2 = this.crawlingDAO.getSelectedStockMap2(crawlingDTO);
		return selectedStockMap2;
	};
	public Map<String,String> getSelectedStockMap3(CrawlingDTO crawlingDTO){
		Map<String,String> selectedStockMap3 = this.crawlingDAO.getSelectedStockMap3(crawlingDTO);
		return selectedStockMap3;
	};
	public List<Map<String,String>> getTopRankStockList(CrawlingDTO crawlingDTO){
		List<Map<String,String>> topRankStockList = this.crawlingDAO.getTopRankStockList(crawlingDTO);
		return topRankStockList;
	}; 
	
	public int getStockListAllCnt(CrawlingSearchDTO crawlingSearchDTO) {
		int stockListAllCnt = this.crawlingDAO.getStockListAllCnt(crawlingSearchDTO);
		return stockListAllCnt;
	};
	public List<Map<String,String>> getStockList(CrawlingSearchDTO crawlingSearchDTO){
		List<Map<String,String>> stockList = this.crawlingDAO.getStockList(crawlingSearchDTO);
		return stockList;
	};
	public int update_rateOfReturn(CrawlingDTO crawlingDTO) {
		int updateCnt = this.crawlingDAO.update_rateOfReturn(crawlingDTO);
		return updateCnt;
	};
	public List<Map<String,String>> getStockList2(CrawlingSearchDTO crawlingSearchDTO){
		List<Map<String,String>> stockList = this.crawlingDAO.getStockList2(crawlingSearchDTO);
		return stockList;
	};

	public int updateSelected_Cnt(CrawlingDTO crawlingDTO) {
		String stock_code1 = crawlingDTO.getSelectedStockCode1();
		int updateCnt1 = this.crawlingDAO.updateSelected_Cnt1(stock_code1);
		String stock_code2 = crawlingDTO.getSelectedStockCode2();
		int updateCnt2 = this.crawlingDAO.updateSelected_Cnt2(stock_code2);
		String stock_code3 = crawlingDTO.getSelectedStockCode3();
		int updateCnt3 = this.crawlingDAO.updateSelected_Cnt3(stock_code3);
		
		if(updateCnt1 + updateCnt2 + updateCnt3 == 3) {return 1;}
		else {return 0;}
	};
	public List<Map<String,String>> getSelectedStockList(CrawlingDTO crawlingDTO){
		List<Map<String,String>> selectedStockList = this.crawlingDAO.getSelectedStockList(crawlingDTO);
		return selectedStockList;
	};
	public Map<String,Double> getSelectedStockROR1(CrawlingDTO crawlingDTO){
		Map<String,Double> selectedStockROR1 = this.crawlingDAO.getSelectedStockROR1(crawlingDTO);
		return selectedStockROR1;
	};
	public Map<String,Double> getSelectedStockROR2(CrawlingDTO crawlingDTO){
		Map<String,Double> selectedStockROR2 = this.crawlingDAO.getSelectedStockROR2(crawlingDTO);
		return selectedStockROR2;
	};
	public Map<String,Double> getSelectedStockROR3(CrawlingDTO crawlingDTO){
		Map<String,Double> selectedStockROR3 = this.crawlingDAO.getSelectedStockROR3(crawlingDTO);
		return selectedStockROR3;
	};
	public List<Map<String,String>> getStockDateList1(CrawlingDTO crawlingDTO){
		List<Map<String,String>> stockDateList1 = this.crawlingDAO.getStockDateList1(crawlingDTO);
		return stockDateList1;
	};
	public List<Map<String,String>> getStockDateList2(CrawlingDTO crawlingDTO){
		List<Map<String,String>> stockDateList2 = this.crawlingDAO.getStockDateList2(crawlingDTO);
		return stockDateList2;
	};
	public List<Map<String,String>> getStockDateList3(CrawlingDTO crawlingDTO){
		List<Map<String,String>> stockDateList3 = this.crawlingDAO.getStockDateList3(crawlingDTO);
		return stockDateList3;
	};
	public List<Map<String,Integer>> getClosePriceList1(CrawlingDTO crawlingDTO){
		List<Map<String,Integer>> closePriceList1 = this.crawlingDAO.getClosePriceList1(crawlingDTO);
		return closePriceList1;
	};
	public List<Map<String,Integer>> getClosePriceList2(CrawlingDTO crawlingDTO){
		List<Map<String,Integer>> closePriceList2 = this.crawlingDAO.getClosePriceList2(crawlingDTO);
		return closePriceList2;
	};
	public List<Map<String,Integer>> getClosePriceList3(CrawlingDTO crawlingDTO){
		List<Map<String,Integer>> closePriceList3 = this.crawlingDAO.getClosePriceList3(crawlingDTO);
		return closePriceList3;
	};
}