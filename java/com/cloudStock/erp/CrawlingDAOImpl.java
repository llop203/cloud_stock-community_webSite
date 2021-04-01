package com.cloudStock.erp;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CrawlingDAOImpl implements CrawlingDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;	

	public String getStandardStockDate(CrawlingDTO crawlingDTO) {
		String standardStockDate = this.sqlSession.selectOne(
			"com.cloudStock.erp.CrawlingDAO.getStandardStockDate"	
			,crawlingDTO							 
		);		
		return standardStockDate;
	}
	public Map<String,String> getSelectedStockMap1(CrawlingDTO crawlingDTO){
		Map<String,String> selectedStockMap1 = this.sqlSession.selectOne(
			"com.cloudStock.erp.CrawlingDAO.getSelectedStockMap1"	
			,crawlingDTO							 
		);		
		return selectedStockMap1;
	};
	public Map<String,String> getSelectedStockMap2(CrawlingDTO crawlingDTO){
		Map<String,String> selectedStockMap2 = this.sqlSession.selectOne(
			"com.cloudStock.erp.CrawlingDAO.getSelectedStockMap2"	
			,crawlingDTO							 
		);		
		return selectedStockMap2;
	};
	public Map<String,String> getSelectedStockMap3(CrawlingDTO crawlingDTO){
		Map<String,String> selectedStockMap3 = this.sqlSession.selectOne(
			"com.cloudStock.erp.CrawlingDAO.getSelectedStockMap3"	
			,crawlingDTO							 
		);		
		return selectedStockMap3;
	};
	public List<Map<String,String>> getTopRankStockList(CrawlingDTO crawlingDTO){ 
		List<Map<String,String>> topRankStockList = this.sqlSession.selectList(
			"com.cloudStock.erp.CrawlingDAO.getTopRankStockList"	
			,crawlingDTO							 
		);		
		return topRankStockList;
	};
	
	public int getStockListAllCnt(CrawlingSearchDTO crawlingSearchDTO) {
		int stockListAllCnt = this.sqlSession.selectOne(
			"com.cloudStock.erp.CrawlingDAO.getStockListAllCnt"	
			,crawlingSearchDTO							 
		);		
		return stockListAllCnt;
	}
	public List<Map<String,String>> getStockList(CrawlingSearchDTO crawlingSearchDTO) {
		List<Map<String,String>> stockList = this.sqlSession.selectList(
			"com.cloudStock.erp.CrawlingDAO.getStockList"	
			,crawlingSearchDTO							 
		);		
		return stockList;
	}
	public int update_rateOfReturn(CrawlingDTO crawlingDTO) {
		int updateCnt = this.sqlSession.update(
				"com.cloudStock.erp.CrawlingDAO.update_rateOfReturn"	
				,crawlingDTO			
		);
		return updateCnt;
	}
	public List<Map<String,String>> getStockList2(CrawlingSearchDTO crawlingSearchDTO) {
		List<Map<String,String>> stockList = this.sqlSession.selectList(
			"com.cloudStock.erp.CrawlingDAO.getStockList2"	
			,crawlingSearchDTO							 
		);		
		return stockList;
	}
	

	public int updateSelected_Cnt1(String stock_code1) {
		int updateCnt1 = this.sqlSession.update(
			"com.cloudStock.erp.CrawlingDAO.updateSelected_Cnt1"	
			,stock_code1							 
		);		
		return updateCnt1;
	};
	public int updateSelected_Cnt2(String stock_code2) {
		int updateCnt2 = this.sqlSession.update(
			"com.cloudStock.erp.CrawlingDAO.updateSelected_Cnt2"	
			,stock_code2							 
		);		
		return updateCnt2;
	};
	public int updateSelected_Cnt3(String stock_code3) {
		int updateCnt3 = this.sqlSession.update(
			"com.cloudStock.erp.CrawlingDAO.updateSelected_Cnt3"	
			,stock_code3							 
		);		
		return updateCnt3;
	};
	public List<Map<String,String>> getSelectedStockList(CrawlingDTO crawlingDTO){
		List<Map<String,String>> selectedstockList = this.sqlSession.selectList(
			"com.cloudStock.erp.CrawlingDAO.getSelectedStockList"	
			,crawlingDTO							 
		);		
		return selectedstockList;
	};
	public Map<String,Double> getSelectedStockROR1(CrawlingDTO crawlingDTO){
		Map<String,Double> selectedStockROR1 = this.sqlSession.selectOne(
			"com.cloudStock.erp.CrawlingDAO.getSelectedStockROR1"	
			,crawlingDTO							 
		);		
		return selectedStockROR1;
	};
	public Map<String,Double> getSelectedStockROR2(CrawlingDTO crawlingDTO){
		Map<String,Double> selectedStockROR2 = this.sqlSession.selectOne(
			"com.cloudStock.erp.CrawlingDAO.getSelectedStockROR2"	
			,crawlingDTO							 
		);		
		return selectedStockROR2;
	};
	public Map<String,Double> getSelectedStockROR3(CrawlingDTO crawlingDTO){
		Map<String,Double> selectedStockROR3 = this.sqlSession.selectOne(
			"com.cloudStock.erp.CrawlingDAO.getSelectedStockROR3"	
			,crawlingDTO							 
		);		
		return selectedStockROR3;
	};
	public List<Map<String,String>> getStockDateList1(CrawlingDTO crawlingDTO){
		List<Map<String,String>> stockDateList1 = this.sqlSession.selectList(
			"com.cloudStock.erp.CrawlingDAO.getStockDateList1"	
			,crawlingDTO							 
		);		
		return stockDateList1;
	};
	public List<Map<String,String>> getStockDateList2(CrawlingDTO crawlingDTO){
		List<Map<String,String>> stockDateList2 = this.sqlSession.selectList(
			"com.cloudStock.erp.CrawlingDAO.getStockDateList2"	
			,crawlingDTO							 
		);		
		return stockDateList2;
	};
	public List<Map<String,String>> getStockDateList3(CrawlingDTO crawlingDTO){
		List<Map<String,String>> stockDateList3 = this.sqlSession.selectList(
			"com.cloudStock.erp.CrawlingDAO.getStockDateList3"	
			,crawlingDTO							 
		);		
		return stockDateList3;
	};
	public List<Map<String,Integer>> getClosePriceList1(CrawlingDTO crawlingDTO){
		List<Map<String,Integer>> closePriceList1 = this.sqlSession.selectList(
			"com.cloudStock.erp.CrawlingDAO.getClosePriceList1"	
			,crawlingDTO							 
		);		
		return closePriceList1;
	};
	public List<Map<String,Integer>> getClosePriceList2(CrawlingDTO crawlingDTO){
		List<Map<String,Integer>> closePriceList2 = this.sqlSession.selectList(
			"com.cloudStock.erp.CrawlingDAO.getClosePriceList2"	
			,crawlingDTO							 
		);		
		return closePriceList2;
	};
	public List<Map<String,Integer>> getClosePriceList3(CrawlingDTO crawlingDTO){
		List<Map<String,Integer>> closePriceList3 = this.sqlSession.selectList(
			"com.cloudStock.erp.CrawlingDAO.getClosePriceList3"	
			,crawlingDTO							 
		);		
		return closePriceList3;
	};
}
