package com.cloudStock.erp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StockDAOImpl implements StockDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;	

	public List<Map<String,String>> getStockCodeList(StockDTO stockDTO){
		List<Map<String,String>> stockCodeList = this.sqlSession.selectList(
				"com.cloudStock.erp.StockDAO.getStockCodeList"	
				,stockDTO
		);
		return stockCodeList;
	};
	
	public String getLastStockDate(StockDTO stockDTO) {
		String lastStockDate = this.sqlSession.selectOne(
				"com.cloudStock.erp.StockDAO.getLastStockDate"	
				,stockDTO
		);
		return lastStockDate;
	};
	
	public int insertStockDate(StockDTO stockDTO) {
		int insertStockCnt = this.sqlSession.insert(
				"com.cloudStock.erp.StockDAO.insertStockDate"	
				,stockDTO
		);
		return insertStockCnt;
	};	
	public int updateStockDate(StockDTO stockDTO) {
		int updateStockDateCnt = this.sqlSession.update(
				"com.cloudStock.erp.StockDAO.updateStockDate"	
				,stockDTO
		);
		return updateStockDateCnt;
	};
	
	public int updatePrice(StockDTO stockDTO) {
		int updatePriceCnt = this.sqlSession.update(
				"com.cloudStock.erp.StockDAO.updatePrice"	
				,stockDTO
		);
		return updatePriceCnt;
	};
}
