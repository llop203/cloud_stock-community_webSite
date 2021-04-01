package com.cloudStock.erp;

public interface AnalysisDAO {
	
	public int checkUsed(AnalysisDTO analysisDTO);
	
	public int insertAnswer(AnalysisDTO analysisDTO);

	public int q1Update(AnalysisDTO analysisDTO);
	
	public int q2Update(AnalysisDTO analysisDTO);
	
	public int q3Update(AnalysisDTO analysisDTO);
	
	public int q4Update(AnalysisDTO analysisDTO);
	
	public int q5Update(AnalysisDTO analysisDTO);
	
	public int q6Update(AnalysisDTO analysisDTO);
	
	public int q7Update(AnalysisDTO analysisDTO);
	
	public int charAvg(AnalysisDTO analysisDTO);
	
	public int q8Update(AnalysisDTO analysisDTO);
	
	public int q9Update(AnalysisDTO analysisDTO);
	
	public int q10Update(AnalysisDTO analysisDTO);
	
	public AnalysisDTO resultList(AnalysisDTO analysisDTO);
	
	
}
