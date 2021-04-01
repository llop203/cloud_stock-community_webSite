package com.cloudStock.erp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class KeywordServiceImpl implements KeywordService{

	@Autowired
	private KeywordDAO keywordDAO;
	
	public List<Map<String, String>> keywordListForm(KeywordSearchDTO keywordSearchDTO){
		List<Map<String,String>> getKeywordList = this.keywordDAO.keywordListForm(keywordSearchDTO); 
		return getKeywordList;
	}
	
	public int getKeywordListAllCnt(KeywordSearchDTO keywordSearchDTO) {
		int keywordListAllCnt = this.keywordDAO.getKeywordListAllCnt(keywordSearchDTO);
		return keywordListAllCnt;
	}
	
	//------------------------------
	public int insertKeyword(KeywordDTO keywordDTO) {

		int getInsertKeyword = this.keywordDAO.insertKeyword(keywordDTO);
		return getInsertKeyword;
	}
	
	public KeywordDTO getKeywordList(KeywordDTO keywordDTO) {
		KeywordDTO keywordList = this.keywordDAO.getKeywordList(keywordDTO);
		
		return keywordList;
	}

	public int getKeywordCnt(KeywordDTO keywordDTO) {
		int result = 0;
		int keywordCnt = 0;
		int keywordCheck = 0;
		int keywordExist = 0;
		
		// 더이상 존재 하지 않는 키워드가 있을 경우 -2를 리턴
		keywordExist = this.keywordDAO.getKeywordExist(keywordDTO);
		
		if(keywordExist == 0) {
			return -2;
		}
		
		else {
			
			keywordCheck = this.keywordDAO.getKeywordCheck(keywordDTO);
		}
		
		// 이미 존재하는 이름의 키워드가 있으면 -1을 리턴
		if(keywordCheck > 1) {
			return -1;
		}
		
		else {
			// keyword Update실행
			keywordCnt = this.keywordDAO.getKeywordCnt(keywordDTO);
		}

		return keywordCnt;

	}
	
	public int getKeywordCnt_Del(KeywordDTO keywordDTO) {
		int keywordCnt_Del = 0;
		int keywordExist = 0;
		
		// 더이상 존재 하지 않는 키워드가 있을 경우 -2를 리턴
		keywordExist = this.keywordDAO.getKeywordExist(keywordDTO);

		if(keywordExist == 0) {
			return -2;
		}
		
		else {
			keywordCnt_Del = this.keywordDAO.getKeywordCnt_Del(keywordDTO);
		}
		
		return keywordCnt_Del;
	}
	
}
