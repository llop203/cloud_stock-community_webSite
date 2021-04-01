package com.cloudStock.erp;

public class FreeBoardSearchDTO {
	
	private Object user_id;
	private String keyword1 = "";
	private int selectPageNo = 1;
	private int rowCntPerPage = 10;
	private int search = 1;
	private String[] date;
	private String orderby;
	
	public Object getUser_id() {
		return user_id;
	}
	public void setUser_id(Object user_id) {
		this.user_id = user_id;
	}
	public String getKeyword1() {
		return keyword1;
	}
	public void setKeyword1(String keyword1) {
		this.keyword1 = keyword1;
	}
	public int getSelectPageNo() {
		return selectPageNo;
	}
	public void setSelectPageNo(int selectPageNo) {
		this.selectPageNo = selectPageNo;
	}
	public int getRowCntPerPage() {
		return rowCntPerPage;
	}
	public void setRowCntPerPage(int rowCntPerPage) {
		this.rowCntPerPage = rowCntPerPage;
	}
	public int getSearch() {
		return search;
	}
	public void setSearch(int search) {
		this.search = search;
	}
	public String[] getDate() {
		return date;
	}
	public void setDate(String[] date) {
		this.date = date;
	}
	public String getOrderby() {
		return orderby;
	}
	public void setOrderby(String orderby) {
		this.orderby = orderby;
	}

	
	
	
}
