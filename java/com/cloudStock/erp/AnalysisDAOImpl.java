package com.cloudStock.erp;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AnalysisDAOImpl implements AnalysisDAO{
	
	@Autowired
	private SqlSessionTemplate sqlsession;

	public int checkUsed(AnalysisDTO analysisDTO) {
		int getCheckUsed = this.sqlsession.selectOne(
				"com.cloudStock.erp.AnalysisDAO.checkUsed",
				analysisDTO
				);
		
		return getCheckUsed;
	}
	
	public int insertAnswer(AnalysisDTO analysisDTO) {
		int getInsertAnswer = this.sqlsession.insert(
				"com.cloudStock.erp.AnalysisDAO.insertAnswer",
				analysisDTO
				);
		
		return getInsertAnswer;
	}

	public int q1Update(AnalysisDTO analysisDTO) {
		int getQ1Update = this.sqlsession.update(
				"com.cloudStock.erp.AnalysisDAO.q1Update",
				analysisDTO
				);
		
		return getQ1Update;
	}
	
	public int q2Update(AnalysisDTO analysisDTO) {
		int getQ2Update = this.sqlsession.update(
				"com.cloudStock.erp.AnalysisDAO.q2Update",
				analysisDTO
				);
		
		return getQ2Update;
	}
	
	public int q3Update(AnalysisDTO analysisDTO) {
		int getQ3Update = this.sqlsession.update(
				"com.cloudStock.erp.AnalysisDAO.q3Update",
				analysisDTO
				);
		
		return getQ3Update;
	}
	
	public int q4Update(AnalysisDTO analysisDTO) {
		int getQ4Update = this.sqlsession.update(
				"com.cloudStock.erp.AnalysisDAO.q4Update",
				analysisDTO
				);
		
		return getQ4Update;
	}
	
	public int q5Update(AnalysisDTO analysisDTO) {
		int getQ5Update = this.sqlsession.update(
				"com.cloudStock.erp.AnalysisDAO.q5Update",
				analysisDTO
				);
		
		return getQ5Update;
	}
	
	public int q6Update(AnalysisDTO analysisDTO) {
		int getQ6Update = this.sqlsession.update(
				"com.cloudStock.erp.AnalysisDAO.q6Update",
				analysisDTO
				);
		
		return getQ6Update;
	}
	
	public int q7Update(AnalysisDTO analysisDTO) {
		int getQ7Update = this.sqlsession.update(
				"com.cloudStock.erp.AnalysisDAO.q7Update",
				analysisDTO
				);
		
		return getQ7Update;
	}
	
	public int charAvg(AnalysisDTO analysisDTO) {
		int getCharAvg = this.sqlsession.update(
				"com.cloudStock.erp.AnalysisDAO.charAvg",
				analysisDTO
				);
		
		return getCharAvg;
	}
	
	public int q8Update(AnalysisDTO analysisDTO) {
		int getQ8Update = this.sqlsession.update(
				"com.cloudStock.erp.AnalysisDAO.q8Update",
				analysisDTO
				);
		
		return getQ8Update;
	}
	
	public int q9Update(AnalysisDTO analysisDTO) {
		int getQ9Update = this.sqlsession.update(
				"com.cloudStock.erp.AnalysisDAO.q9Update",
				analysisDTO
				);
		
		return getQ9Update;
	}
	
	public int q10Update(AnalysisDTO analysisDTO) {
		int getQ10Update = this.sqlsession.update(
				"com.cloudStock.erp.AnalysisDAO.q10Update",
				analysisDTO
				);
		
		return getQ10Update;
	}
	
	public AnalysisDTO resultList(AnalysisDTO analysisDTO) {
		
		AnalysisDTO getResultList = this.sqlsession.selectOne(
				"com.cloudStock.erp.AnalysisDAO.resultList",
				analysisDTO
				);
		return getResultList;
	}
	
	
	
	
	
}









