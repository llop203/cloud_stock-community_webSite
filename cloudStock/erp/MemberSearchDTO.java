package com.cloudStock.erp;

public class MemberSearchDTO {
	private String text_search;
	private String text;
	private String begin_year;
	private String begin_month;
	private String end_year;
	private String end_month;
	private String user_gender;
	private String join_year;
	private String join_month;
	private String join_day;
	private String min_purp;
	private String max_purp;
	private String min_asset;
	private String max_asset;
	private String min_salary;
	private String max_salary;
	private int selectPageNo = 1;
	private int rowCntPerPage = 10;
	private String order;
	public String getText_search() {
		return text_search;
	}
	public void setText_search(String text_search) {
		this.text_search = text_search;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getBegin_year() {
		return begin_year;
	}
	public void setBegin_year(String begin_year) {
		this.begin_year = begin_year;
	}
	public String getBegin_month() {
		return begin_month;
	}
	public void setBegin_month(String begin_month) {
		this.begin_month = begin_month;
	}
	public String getEnd_year() {
		return end_year;
	}
	public void setEnd_year(String end_year) {
		this.end_year = end_year;
	}
	public String getEnd_month() {
		return end_month;
	}
	public void setEnd_month(String end_month) {
		this.end_month = end_month;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public String getJoin_year() {
		return join_year;
	}
	public void setJoin_year(String join_year) {
		this.join_year = join_year;
	}
	public String getJoin_month() {
		return join_month;
	}
	public void setJoin_month(String join_month) {
		this.join_month = join_month;
	}
	public String getJoin_day() {
		return join_day;
	}
	public void setJoin_day(String join_day) {
		this.join_day = join_day;
	}
	public String getMin_purp() {
		return min_purp;
	}
	public void setMin_purp(String min_purp) {
		this.min_purp = min_purp;
	}
	public String getMax_purp() {
		return max_purp;
	}
	public void setMax_purp(String max_purp) {
		this.max_purp = max_purp;
	}
	public String getMin_asset() {
		return min_asset;
	}
	public void setMin_asset(String min_asset) {
		this.min_asset = min_asset;
	}
	public String getMax_asset() {
		return max_asset;
	}
	public void setMax_asset(String max_asset) {
		this.max_asset = max_asset;
	}
	public String getMin_salary() {
		return min_salary;
	}
	public void setMin_salary(String min_salary) {
		this.min_salary = min_salary;
	}
	public String getMax_salary() {
		return max_salary;
	}
	public void setMax_salary(String max_salary) {
		this.max_salary = max_salary;
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
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	
	
	
}
