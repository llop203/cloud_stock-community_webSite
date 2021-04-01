package com.cloudStock.erp;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/memberListForm.do")
	public ModelAndView memberListForm(MemberSearchDTO memberSearchDTO) {
		ModelAndView mav = new ModelAndView();
		
		int listAllCnt = this.memberService.getMemberListAllCnt(memberSearchDTO);
		if(listAllCnt > 0) {
			int beginRowNo = memberSearchDTO.getSelectPageNo() * memberSearchDTO.getRowCntPerPage()
							- memberSearchDTO.getRowCntPerPage() + 1;		
			if(listAllCnt < beginRowNo) {
				memberSearchDTO.setSelectPageNo(1);
			}
		}
		
		List<Map<String, String>> memberList = this.memberService.memberListForm(memberSearchDTO);
		
		mav.setViewName("memberListForm.jsp");
		mav.addObject("memberList", memberList);
		mav.addObject("memberSearchDTO", memberSearchDTO);
		mav.addObject("listAllCnt", listAllCnt);
		return mav;
	}

	@RequestMapping("/memberPageForm.do")
	public ModelAndView memberPageForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("memberPageForm.jsp");
		return mav;
	}

}
