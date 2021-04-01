package com.cloudStock.erp;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class JoinServiceImpl implements JoinService {
	@Autowired JoinDAO joinDAO;
	
	public int getjoinCnt(JoinDTO joinDTO) {
		int joinCnt = this.joinDAO.getjoinCnt(joinDTO);
				
		return joinCnt;
	}
	
	public int idCheckCnt(JoinDTO joinDTO) {
		int getidCheckCnt = this.joinDAO.idCheckCnt(joinDTO);
		if(getidCheckCnt<1) {
			return -1;
		}
		
		
		return getidCheckCnt;
	}

	

}
