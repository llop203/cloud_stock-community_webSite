package com.cloudStock.erp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AnalysisServiceImpl implements AnalysisService{
	@Autowired
	private AnalysisDAO analysisDAO;
	
	// 첫 질문 업데이트를 하기 전에 기존에 이 서비스를 이용 했었는지 확인
	// 확인 후 서비스를 이용 한적이 없으면 user_no만 데이터를 넣어주고 나머지는 null 처리하여 insert
	public int q1Update(AnalysisDTO analysisDTO) {
		
		int getCheckUsed = this.analysisDAO.checkUsed(analysisDTO);
		
		if(getCheckUsed == 0) {
			int getInsertAnswer = this.analysisDAO.insertAnswer(analysisDTO);
		}
		
		int getQ1Update = this.analysisDAO.q1Update(analysisDTO);
		
		return getQ1Update;
	}
	
	// q2 업데이트
	public int q2Update(AnalysisDTO analysisDTO) {
		int getQ2Update = this.analysisDAO.q2Update(analysisDTO);
		
		return getQ2Update;
	}
	
	// q3 업데이트
	public int q3Update(AnalysisDTO analysisDTO) {
		int getQ3Update = this.analysisDAO.q3Update(analysisDTO);
		
		return getQ3Update;
	}
	
	// q4 업데이트
	public int q4Update(AnalysisDTO analysisDTO) {
		int getQ4Update = this.analysisDAO.q4Update(analysisDTO);
		
		return getQ4Update;
	}
	
	// q5 업데이트
	public int q5Update(AnalysisDTO analysisDTO) {
		int getQ5Update = this.analysisDAO.q5Update(analysisDTO);
		
		return getQ5Update;
	}
	
	// q6 업데이트
	public int q6Update(AnalysisDTO analysisDTO) {
		int getQ6Update = this.analysisDAO.q6Update(analysisDTO);
		
		return getQ6Update;
	}
	
	// q7 업데이트 및 평균 char 구해서 대입
	public int q7Update(AnalysisDTO analysisDTO) {
		
		int getCharAvg = 0;
		int getQ7Update = this.analysisDAO.q7Update(analysisDTO);
		
		if(getQ7Update == 1) {
			getCharAvg = this.analysisDAO.charAvg(analysisDTO);
		}
		
		return getQ7Update;
	}
	
	
	// q8 업데이트
	public int q8Update(AnalysisDTO analysisDTO) {
		int getQ8Update = this.analysisDAO.q8Update(analysisDTO);
		
		return getQ8Update;
	}
	
	// q9 업데이트
	public int q9Update(AnalysisDTO analysisDTO) {
		int getQ9Update = this.analysisDAO.q9Update(analysisDTO);
		
		return getQ9Update;
	}
	
	// q10 업데이트
	public int q10Update(AnalysisDTO analysisDTO) {
		int getQ10Update = this.analysisDAO.q10Update(analysisDTO);
		
		return getQ10Update;
	}
	
	public AnalysisDTO resultList(AnalysisDTO analysisDTO) {
		
		AnalysisDTO getResultList = this.analysisDAO.resultList(analysisDTO);
		
		return getResultList;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
