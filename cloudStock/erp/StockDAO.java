package com.cloudStock.erp;

import java.util.List;
import java.util.Map;

public interface StockDAO {

	public List<Map<String,String>> getStockCodeList(StockDTO stockDTO);
	
	public String getLastStockDate(StockDTO stockDTO);
	
	public int insertStockDate(StockDTO stockDTO);
	public int updateStockDate(StockDTO stockDTO);

	public int updatePrice(StockDTO stockDTO);
	
}
