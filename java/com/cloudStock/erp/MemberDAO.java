package com.cloudStock.erp;

import java.util.List;
import java.util.Map;

public interface MemberDAO {

	public List<Map<String, String>> memberListForm(MemberSearchDTO memberSearchDTO);
	
	public int getMemberListAllCnt(MemberSearchDTO memberSearchDTO);
}
