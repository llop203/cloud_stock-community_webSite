package com.cloudStock.erp;

import java.util.List;
import java.util.Map;

public interface KeywordDAO {

	List<Map<String, String>> keywordListForm(KeywordSearchDTO keywordSearchDTO);

	int getKeywordListAllCnt(KeywordSearchDTO keywordSearchDTO);

	//----------------------------------
	
	public int insertKeyword(KeywordDTO keywordDTO);

	public KeywordDTO getKeywordList(KeywordDTO keywordDTO);
	
	public int getKeywordCheck(KeywordDTO keywordDTO);
	
	public int getKeywordExist(KeywordDTO keywordDTO);

	public int getKeywordCnt(KeywordDTO keywordDTO);
	
	public int getKeywordCnt_Del(KeywordDTO keywordDTO);
	
	



}
