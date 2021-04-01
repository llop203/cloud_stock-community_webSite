package com.cloudStock.erp;

public class KeywordSearchDTO {
	private Object key_no;
	private Object user_no;
	private int selectPageNo = 1;
	private int rowCntPerPage = 10; 
	private String keyword1;
	public Object getKey_no() {
		return key_no;
	}
	public void setKey_no(Object key_no) {
		this.key_no = key_no;
	}
	public Object getUser_no() {
		return user_no;
	}
	public void setUser_no(Object user_no) {
		this.user_no = user_no;
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
	public String getKeyword1() {
		return keyword1;
	}
	public void setKeyword1(String keyword1) {
		this.keyword1 = keyword1;
	}


	
	

}
