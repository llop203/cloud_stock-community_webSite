package com.cloudStock.erp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class KeywordDAOImpl implements KeywordDAO{

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	public List<Map<String, String>> keywordListForm(KeywordSearchDTO keywordSearchDTO){
		List<Map<String,String>> getKeywordList = this.sqlsession.selectList(
				"com.cloudStock.mapper.KeywordDAO.keywordListForm",keywordSearchDTO); 
		return getKeywordList;
	}
	
	public int getKeywordListAllCnt(KeywordSearchDTO keywordSearchDTO ) {
		int keywordListAllCnt = this.sqlsession.selectOne(
				"com.cloudStock.mapper.KeywordDAO.getKeywordListAllCnt" 
				, keywordSearchDTO
		);
		return keywordListAllCnt;
	}	
	
	public int insertKeyword(KeywordDTO keywordDTO) {

		int getInsertKeyword = this.sqlsession.insert(
				"com.cloudStock.mapper.KeywordDAO.insertKeyword"
				, keywordDTO);
		return getInsertKeyword;
	}
	
	//------------------------------------------

	public KeywordDTO getKeywordList(KeywordDTO keywordDTO) {
		KeywordDTO keywordList = this.sqlsession.selectOne(
				"com.cloudStock.mapper.KeywordDAO.getKeywordList"
				,keywordDTO
				);
		
		return keywordList;
	}

	public int getKeywordCheck(KeywordDTO keywordDTO) {
		int keywordCheck = this.sqlsession.selectOne(
				"com.cloudStock.mapper.KeywordDAO.getKeywordCheck"
				,keywordDTO	
				);
		return keywordCheck;
	}
	
	public int getKeywordExist(KeywordDTO keywordDTO) {
		int keywordExist = this.sqlsession.selectOne(
				"com.cloudStock.mapper.KeywordDAO.getKeywordExist"
				,keywordDTO	
				);
		return keywordExist;
	}

	public int getKeywordCnt(KeywordDTO keywordDTO) {
		int keywordCnt = this.sqlsession.update(
				"com.cloudStock.mapper.KeywordDAO.getKeywordCnt"
				,keywordDTO	
				);
		return keywordCnt;
	}
	
	public int getKeywordCnt_Del(KeywordDTO keywordDTO) {
		int keywordCnt_Del = this.sqlsession.delete(
				"com.cloudStock.mapper.KeywordDAO.getKeywordCnt_Del"
				,keywordDTO	
				);
		return keywordCnt_Del;
	}
	
	


}
