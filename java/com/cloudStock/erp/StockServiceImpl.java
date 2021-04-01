package com.cloudStock.erp;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class StockServiceImpl implements StockService {	
	
	@Autowired
	private StockDAO stockDAO;

	public int insertStock(StockDTO stockDTO) {
		Parser_KoreaStock2 urlParser1 = new Parser_KoreaStock2();
		String url1 = "https://finance.naver.com/item/sise_day.nhn?code=";
		String url2 = "&page=";
		
		

		List<Map<String,String>> stockCodeList = this.stockDAO.getStockCodeList(stockDTO);
		String stock_code = "";		
		int returnCnt = 0;
		
		for(int j=0 ; j<stockCodeList.size() ; j++) {
			stock_code = stockCodeList.get(j).get("stock_code");	
			
			ArrayList<String> stockDateList = new ArrayList<String>();
			ArrayList<String> closePriceList = new ArrayList<String>();	
			ArrayList<String> openPriceList = new ArrayList<String>();	
			ArrayList<String> highestPriceList = new ArrayList<String>();	
			ArrayList<String> lowestPriceList = new ArrayList<String>();	
			
			for(int i=1 ; i<2 ; i++) {
				ArrayList<ArrayList<String>> arr_tmp = urlParser1.parseToURL(url1 + stock_code + url2 + i);
				
				stockDateList.addAll(arr_tmp.get(0));
				closePriceList.addAll(arr_tmp.get(1));
				openPriceList.addAll(arr_tmp.get(2));
				highestPriceList.addAll(arr_tmp.get(3));
				lowestPriceList.addAll(arr_tmp.get(4));
			}	

			Collections.reverse(stockDateList);
			Collections.reverse(closePriceList);
			Collections.reverse(openPriceList);
			Collections.reverse(highestPriceList);
			Collections.reverse(lowestPriceList);
			//---------------------------------------------------------------------
			
			stockDTO.setStock_code(stock_code);
			
			int insertStockCnt = 0;				
			int updateClosePriceCnt = 0;		
			int updateOpenPriceCnt = 0;		
			int updateHighestPriceCnt = 0;		
			int updateLowestPriceCnt = 0;		
			int updatePriceCnt = 0;	
			
			
			for(int i=0 ; i<stockDateList.size() ; i++) {
				if(stockDateList.get(i).length() != 0) {
					String lastStockDate = this.stockDAO.getLastStockDate(stockDTO);
					if(Integer.parseInt(lastStockDate) < Integer.parseInt(stockDateList.get(i).replace("-", ""))) {
						
						stockDTO.setStock_date(stockDateList.get(i));
						insertStockCnt = this.stockDAO.insertStockDate(stockDTO);					
	
						stockDTO.setClose_price(closePriceList.get(i));
						stockDTO.setOpen_price(openPriceList.get(i));
						stockDTO.setHighest_price(highestPriceList.get(i));
						stockDTO.setLowest_price(lowestPriceList.get(i));
						updatePriceCnt = this.stockDAO.updatePrice(stockDTO);
						
						returnCnt = updatePriceCnt;
					}
					else if(Integer.parseInt(lastStockDate) == Integer.parseInt(stockDateList.get(i).replace("-", ""))) {
						
						stockDTO.setStock_date(stockDateList.get(i));
	
						stockDTO.setClose_price(closePriceList.get(i));
						stockDTO.setOpen_price(openPriceList.get(i));
						stockDTO.setHighest_price(highestPriceList.get(i));
						stockDTO.setLowest_price(lowestPriceList.get(i));
						updatePriceCnt = this.stockDAO.updatePrice(stockDTO);
						
						returnCnt = updatePriceCnt;
					}					
				}				
			}
		}
		return returnCnt;
	}
	
}
