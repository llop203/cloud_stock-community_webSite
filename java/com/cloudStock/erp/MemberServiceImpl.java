package com.cloudStock.erp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO memberDAO;
	
	public List<Map<String, String>> memberListForm(MemberSearchDTO memberSearchDTO){
		List<Map<String, String>> memberList = this.memberDAO.memberListForm(memberSearchDTO);
		
		return memberList;
	}
	
	public int getMemberListAllCnt(MemberSearchDTO memberSearchDTO) {
		int listAllCnt = this.memberDAO.getMemberListAllCnt(memberSearchDTO);
		
		return listAllCnt;
	}
}
