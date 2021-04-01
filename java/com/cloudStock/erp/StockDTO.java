package com.cloudStock.erp;

import java.util.ArrayList;

public class StockDTO {
	private String stock_code;
	private String stock_date;
	private String close_price;
	private String open_price;
	private String highest_price;
	private String lowest_price;
	private String lastStockDate;
	
	public String getStock_code() {
		return stock_code;
	}
	public void setStock_code(String stock_code) {
		this.stock_code = stock_code;
	}
	public String getStock_date() {
		return stock_date;
	}
	public void setStock_date(String stock_date) {
		this.stock_date = stock_date;
	}
	public String getClose_price() {
		return close_price;
	}
	public void setClose_price(String close_price) {
		this.close_price = close_price;
	}
	public String getOpen_price() {
		return open_price;
	}
	public void setOpen_price(String open_price) {
		this.open_price = open_price;
	}
	public String getHighest_price() {
		return highest_price;
	}
	public void setHighest_price(String highest_price) {
		this.highest_price = highest_price;
	}
	public String getLowest_price() {
		return lowest_price;
	}
	public void setLowest_price(String lowest_price) {
		this.lowest_price = lowest_price;
	}
	public String getLastStockDate() {
		return lastStockDate;
	}
	public void setLastStockDate(String lastStockDate) {
		this.lastStockDate = lastStockDate;
	}
	
}
